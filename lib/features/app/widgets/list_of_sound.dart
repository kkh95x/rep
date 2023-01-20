import 'dart:convert';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/pdf_page.dart';
import 'package:alsallabi/features/app/pages/sound_page_branche.dart';
import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class ListMp3Controller extends StatelessWidget {
  ListMp3Controller({super.key});


  Future<List<Aricels>> getData() async {
    final repo = GetIt.instance<Dio>();

    var respons =
        await repo.get('$baseUrl/api/salabiSoundMainAPI/');
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {

                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/mp3.png"),
                          Text(
                            textAlign: TextAlign.center,
                            "${snapshot.data![index].fields['title']}",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          ButtonReadMore(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SoundPlayeBranch(
                                  aricels: snapshot.data!,index:index,
                                ),
                              ));
                            },
                          )
                        ],
                      )
                      // child: Column(
                      //   children: [
                      //     CachedNetworkImage(imageUrl:"https://alsallabi.com/media/${snapshot.data![index].fields['link']}" )
                      //     ,Text(
                      //       "${snapshot.data![index].fields['title']}",
                      //       style: Theme.of(context).textTheme.displaySmall,
                      //     ),
                      //   ],
                      // ),
                      );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: SizedBox(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
