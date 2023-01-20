import 'dart:convert';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/media_photo_branch.dart';
import 'package:alsallabi/features/app/pages/pdf_page.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListVieHorzPhotoControler extends StatefulWidget {
  ListVieHorzPhotoControler({super.key});

  @override
  State<ListVieHorzPhotoControler> createState() =>
      _ListVieHorzPhotoControlerState();
}

class _ListVieHorzPhotoControlerState extends State<ListVieHorzPhotoControler> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Future<List<Aricels>> getPhoto() async {
    final repo = GetIt.instance<Dio>();

    var respons =
        await repo.get('$baseUrl/api/salabiImageMainAPI/');
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
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
            future: getPhoto(),
            builder: (context, snapshot) {
              print(snapshot.data);

              if (snapshot.hasData) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const MediaPhotoBranch(pk: "57"),
                        ));
                      },
                      child: CachedNetworkImage(
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                        imageUrl:
                            "$baseUrl/media/${snapshot.data![index].fields['image']}",
                      ),
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
      ),
    );
  }
}
