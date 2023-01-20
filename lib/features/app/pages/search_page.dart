// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/arcticals_page.dart';
import 'package:alsallabi/features/app/pages/pdf_page.dart';
import 'package:alsallabi/features/app/pages/salabi_books.dart';
import 'package:alsallabi/features/app/pages/sound_page_branche.dart';
import 'package:alsallabi/features/app/pages/video_pages.dart';
import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';

import 'package:alsallabi/features/app/widgets/carouse_image_Container_widget.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:alsallabi/features/viedos/data/video_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.onTap});
  final void Function() onTap;
  TextEditingController text = TextEditingController();
  ValueNotifier<int> booksvalueNotifier = ValueNotifier(0);
  ValueNotifier<int> articalsValueNotifier = ValueNotifier(0);
  ValueNotifier<int> videosValueNotifier = ValueNotifier(0);
    ValueNotifier<int> soundValueNotifier = ValueNotifier(0);


  List<Aricels> listBooks = [];
  List<Aricels> listArticals = [];
  List<VideoModel> listVideo = [];
    List<Aricels> listSound = [];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await searchMethoud(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey.shade400)),
                    child: const Icon(Icons.search),
                  ),
                ),
                Container(
                    height: 50,

                    width: MediaQuery.of(context).size.width - 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400)),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: text,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                            hintText: "البحث",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.grey.shade400),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    style: BorderStyle.none, width: 0.0),
                                borderRadius: BorderRadius.circular(30))),
                        onFieldSubmitted: (value) async {
                        await  searchMethoud(context);
                        },
                        onChanged: (value) {
                          if (value == "") {}
                        },
                      ),
                    )),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: booksvalueNotifier,
            builder: (context, value, child) {
              return Visibility(
                visible: value != 0,
                child: Column(
                  children: [
                    Visibility(
                        visible: value == 2,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        )),
                    Visibility(
                      visible: value == 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "الكتب",
                            ),
                          ),
                          SizedBox(
                            height: 540,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listBooks.length,
                              padding: const EdgeInsets.all(10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                            height: 150,
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Center(
                                                    child: Icon(
                                                        Icons.hourglass_empty)),
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                "$baseUrl/media/${listBooks[index].fields['image']}"),
                                        const  SizedBox(height: 8,),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "${listBooks[index].fields['meta']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 8),
                                        ),
                                        Text(
                                          "⏱ ${(listBooks[index].fields['date'] as String).substring(0, 10)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        ButtonReadMore(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) {
                                                return PdfPage(
                                                  articel: listBooks,
                                                  index: index,
                                                );
                                              },
                                            ));
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
            valueListenable: articalsValueNotifier,
            builder: (context, value, child) {
              return Visibility(
                visible: value != 0,
                child: Column(
                  children: [
                    Visibility(
                      visible: value == 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         const Padding(
                            padding:  EdgeInsets.all(10.0),
                            child:  Text(
                              "المقالات",
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 540,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listArticals.length,
                              padding: const EdgeInsets.all(10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                            height: 150,
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Center(
                                                    child: Icon(
                                                        Icons.hourglass_empty)),
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                "$baseUrl/media/${listArticals[index].fields['image']}"),
                                        const  SizedBox(height: 8,),
                                        SizedBox(
                                          height: 10,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "${listArticals[index].fields['title']}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(fontSize: 7),
                                          ),
                                        ),
                                        Text(
                                          "⏱ ${(listArticals[index].fields['datecteated'] as String).substring(0, 10)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        ButtonReadMore(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return ArtcalesPage(
                                                  aricels: listArticals,
                                                  index: index);
                                            }));
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
            valueListenable: videosValueNotifier,
            builder: (context, value, child) {
              return Column(
                children: [
                  Visibility(
                    visible: value == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       const Padding(
                          padding:  EdgeInsets.all(10.0),
                          child:  Text(
                            "المكتبة المرئية",
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 526,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listArticals.length,
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                          height: 150,
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                                  child: Icon(
                                                      Icons.hourglass_empty)),
                                          fit: BoxFit.fill,
                                          imageUrl:
                                              "https://img.youtube.com/vi/${listVideo[index].fields['image']}/sddefault.jpg}"),
                                      SizedBox(
                                        height: 10,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "${listArticals[index].fields['title']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 7),
                                        ),
                                      ),
                                      Text(
                                        "⏱ ${(listVideo[index].fields['datetime'] as String).substring(0, 10)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      ButtonReadMore(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return VideoPAge(
                                                videoModel: listVideo,
                                                index: index);
                                          }));
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )
          ,ValueListenableBuilder(
            valueListenable: videosValueNotifier,
            builder: (context, value, child) {
              return Column(
                children: [
                  Visibility(
                    visible: value == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       const Padding(
                          padding:  EdgeInsets.all(10.0),
                          child:  Text(
                            "المكتبة الصوتية",
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 526,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listSound.length,
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset("assets/images/mp3.png",
                                        height: 130,
                                        width: 180,
                                         fit: BoxFit.fill,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "${listSound[index].fields['title']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(fontSize: 7),
                                        ),
                                      ),
                                      Text(
                                        "⏱ ${(listSound[index].fields['datetime'] as String).substring(0, 10)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      ButtonReadMore(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return SoundPlayeBranch(
                                                aricels: listSound,
                                                index: index);
                                          }));
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        
        ],
      ),
    );
  }

  Future<void> searchMethoud(BuildContext context) async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusScope.of(context).unfocus();

    if (text.text.isEmpty) {
      videosValueNotifier.value = 0;
      articalsValueNotifier.value = 0;
      booksvalueNotifier.value = 0;
            soundValueNotifier.value = 0;

    } else {
      booksvalueNotifier.value = 2;
      listBooks = await getBookData(text.text);

      articalsValueNotifier.value = 2;
      listArticals = await getArticalData();

      videosValueNotifier.value = 2;
      listVideo = await getVideoData();


      soundValueNotifier.value = 2;
      listSound = await getSoundData();

      if (listBooks.isEmpty) {
        booksvalueNotifier.value = 0;
      } else {
        booksvalueNotifier.value = 1;
      }
      if (listArticals.isEmpty) {
        articalsValueNotifier.value = 0;
      } else {
        articalsValueNotifier.value = 1;
      }
      if (listVideo.isEmpty) {
        videosValueNotifier.value = 0;
      } else {
        videosValueNotifier.value = 1;
      }
       if (listVideo.isEmpty) {
        soundValueNotifier.value = 0;
      } else {
        soundValueNotifier.value = 1;
      }
    }
  }

  Future<List<Aricels>> getBookData(String keySearch) async {
    final repo = GetIt.instance<Dio>();
    var respons = await repo.post(
      '$baseUrl/api/salabiBookssearchAPI/',
      data: {'search_text': keySearch, "page": 1},
    );
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

  Future<List<Aricels>> getArticalData() async {
    final repo = GetIt.instance<Dio>();
    var respons = await repo.post('$baseUrl/api/salabiArticlessearchAPI/',
        data: {'search_text': text.text, "page": 1});
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

  Future<List<VideoModel>> getVideoData() async {
    final repo = GetIt.instance<Dio>();
    var respons = await repo.post('$baseUrl/api/salabiVideosearchAPI/',
        data: {'search_text': text.text, "page": 1});
    List<VideoModel> list = [];
    if (respons.statusCode == 200) {
      for (var x in respons.data) {
        list.add(VideoModel.fromJson(x));
      }

      return list;
    } else {
      throw Exception(respons.statusMessage);
    }
  }
  
  Future<List<Aricels>> getSoundData() async {
    final repo = GetIt.instance<Dio>();
    var respons = await repo.post('$baseUrl/api/salabiSoundsearchAPI/',
        data: {'search_text': text.text, "page": 1});
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
