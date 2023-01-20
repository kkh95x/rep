import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/sound_page_branche.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

class MediaSoundBranch extends StatelessWidget {
  const MediaSoundBranch({super.key, required this.pk});
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset("assets/images/mp3.png",
                            fit: BoxFit.cover,
                            width: 300,
                            height: 300,
                            
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "${snapshot.data![index].fields['title']}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                             const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 110,
                              height: 40,
                              decoration: BoxDecoration(

                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SoundPlayeBranch(
                                          aricels: snapshot.data!,index:index),
                                    ));
                                  },
                                  child: Text(
                                    "أقرأ المزيد",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: Colors.white),
                                  )),
                            ),
                            const SizedBox(height: 20,)
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
                    itemCount: snapshot.data!.length),
              );
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
        await repo.get("$baseUrl/api/salabiSoundPageAPI/$pk");
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
