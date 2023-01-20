import 'package:alsallabi/features/app/pages/fatwa_page.dart';
import 'package:alsallabi/features/app/pages/media_video_branch_page.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

class TasnefatPage extends StatelessWidget {
   TasnefatPage({super.key ,required this.url});
  final  String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                children: snapshot.data!
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 310,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return FatawPage(
                                        pk: e.pk,
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
                          ),
                        ))
                    .toList());
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

  Future<List<Aricels>> getData() async {
    final repo = GetIt.instance<Dio>();
    var respons = await repo
        .get(url);
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
