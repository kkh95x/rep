import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/media_photo_branch.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

class MediaPhotoPAge extends StatelessWidget {
  const MediaPhotoPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: snapshot.data!.map((e) => 
              Padding(
                padding: EdgeInsets.all(10),
                child:  Container(
                            width: 310,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MediaPhotoBranch(
                                        pk: "${e.pk}",
                                      );
                                    },
                                  ));
                                },
                                child: Text(
                                  "${e.fields['name']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white),
                                )),
                          )

                ,)
              
              
              ).toList(),
            );
          } else if (snapshot.hasError) {
            return SizedBox();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Aricels>> getdata() async {
    final repo = GetIt.instance<Dio>();
    var respons =
        await repo.get("$baseUrl/api/salabiImageBranchPageAPI/");
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
