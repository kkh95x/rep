import 'dart:developer';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/arcticals_page.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

class MostArticalsReading extends StatelessWidget {
  const MostArticalsReading({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMostAricals(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "المقالات الأكثر قراءة",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const Divider(color: Colors.black,)
                  ] +
                  [
                    for(int i=0;i<snapshot.data!.length;i++)
                    SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ArtcalesPage(aricels: snapshot.data!,index: i,)));
                              },
                              child: SizedBox(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CachedNetworkImage(
                                        width: 80,
                                        fit: BoxFit.fitWidth,
                                        imageUrl:
                                            "http://fastsperm.com/media/${snapshot.data![i].fields['image']}"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                        width: 200,
                                        child: Text(
                                          "${snapshot.data![i].fields['meta']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ))
                  // ]
                  // snapshot.data!
                  //     .map((e) => SizedBox(
                  //           child: InkWell(
                  //             onTap: () {
                  //               Navigator.of(context).push(MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       ArtcalesPage(aricels: e)));
                  //             },
                  //             child: SizedBox(
                  //               height: 100,
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   CachedNetworkImage(
                  //                       width: 80,
                  //                       fit: BoxFit.fitWidth,
                  //                       imageUrl:
                  //                           "http://fastsperm.com/media/${e.fields['image']}"),
                  //                   SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   SizedBox(
                  //                       width: 200,
                  //                       child: Text(
                  //                         "${e.fields['meta']}",
                  //                         style: Theme.of(context)
                  //                             .textTheme
                  //                             .titleMedium,
                  //                       ))
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ))
                  //     .toList(),
                                  ]))))]));
        
        } else if (snapshot.hasError) {
          return SizedBox();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<Aricels>> getMostAricals() async {
    final repo = GetIt.instance<Dio>();

    var respons = await repo.get('$baseUrl/api/articleMostAPI/');
    List<Aricels> list = [];
    print("------->${respons.data}");
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
