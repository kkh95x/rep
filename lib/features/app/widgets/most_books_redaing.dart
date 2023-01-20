import 'dart:developer';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/pdf_page.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

class MoBooksReading extends StatelessWidget {
  const MoBooksReading({super.key});

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
                        "الكتب الأكثر قراءة",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const Divider()
                  ] +[
                    for(int i=0;i<snapshot.data!.length;i++)
                    SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PdfPage(
                                        articel:snapshot.data!,index: i,
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CachedNetworkImage(
                                        errorWidget:(context, url, error) =>const  Center(child:  Icon(Icons.hourglass_empty)),
                                          width: 80,
                                          fit: BoxFit.fitWidth,
                                          imageUrl:
                                              "$baseUrl/media/${snapshot.data![i].fields['image']}"),
                                      const SizedBox(
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
                                    ],
                                  ),
                                ),
                              ),
                            ),)
                  ]

                  // snapshot.data!
                  //     .map((e) => SizedBox(
                  //           child: InkWell(
                  //             onTap: () {
                  //               Navigator.of(context).push(MaterialPageRoute(
                  //                   builder: (context) => PdfPage(
                  //                       articel:
                  //                           )));
                  //             },
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: SizedBox(
                  //                 height: 100,
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceEvenly,
                  //                   children: [
                  //                     CachedNetworkImage(
                  //                         width: 80,
                  //                         fit: BoxFit.fitWidth,
                  //                         imageUrl:
                  //                             "$baseUrl/media/${e.fields['image']}"),
                  //                     const SizedBox(
                  //                       width: 10,
                  //                     ),
                  //                     SizedBox(
                  //                         width: 200,
                  //                         child: Text(
                  //                           "${e.fields['meta']}",
                  //                           style: Theme.of(context)
                  //                               .textTheme
                  //                               .titleMedium,
                  //                         ))
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ))
                      // .toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return const SizedBox();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<Aricels>> getMostAricals() async {
    final repo = GetIt.instance<Dio>();

    var respons = await repo.get('$baseUrl/api/booksMostAPI/');
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
