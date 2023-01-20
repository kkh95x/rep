import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

class MediaPhotoBranch extends StatelessWidget {
  const MediaPhotoBranch({super.key, required this.pk});
  final String pk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
             return ListView.separated(
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          CachedNetworkImage(
                            height: 500,
                            width: 400,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              imageUrl:
                                  "${snapshot.data![index].fields['image']}"),
                          SizedBox(height: 20,),
                          Text(
                            textAlign: TextAlign.center,
                            "${snapshot.data![index].fields['title']}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 70,
                      child: Divider(),
                    );
                  },
                  itemCount: snapshot.data!.length);
            } else if (snapshot.hasError) {
              return const SizedBox();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      ),
          )),
    );
  }

  Future<List<Aricels>> getdata() async {
    final repo = GetIt.instance<Dio>();
    var respons =
        await repo.get("$baseUrl/api/salabiImagePageAPI/$pk");
    List<Aricels> list = [];
    if (respons.statusCode == 200) {
      for (var x in respons.data) {
        list.add(Aricels.fromJson(x));
      }

      return list;
    } else {
      throw Exception(respons.statusMessage);
    }
  }
}
