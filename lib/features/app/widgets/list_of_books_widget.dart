import 'dart:convert';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/pdf_page.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListVieHorzBooksControler extends StatefulWidget {
  ListVieHorzBooksControler({super.key});

  @override
  State<ListVieHorzBooksControler> createState() =>
      _ListVieHorzBooksControlerState();
}

class _ListVieHorzBooksControlerState extends State<ListVieHorzBooksControler> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Future<List<Aricels>> getBooks() async {
    final repo = GetIt.instance<Dio>();

    var respons =
        await repo.get('$baseUrl/api/salabibooksarabicPageAPI/#');
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
      child: Stack(
        children: [
          FutureBuilder(
              future: getBooks(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PdfPage(
                                articel:
                                   snapshot.data!,index:index),
                          ));
                        },
                        child: SizedBox(
                          width: 200,
                          height: 300,
                          child: CachedNetworkImage(
                            imageUrl:
                                "http://fastsperm.com/media/${snapshot.data![index].fields['image']}",
                          ),
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
              })
        ],
      ),
    );
  }
}
