import 'package:alsallabi/features/app/pages/pdf_page.dart';
import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:alsallabi/features/app/constants/constant.dart';


class SallabiBooksListPage extends StatelessWidget {
  const SallabiBooksListPage({super.key, required this.url});
  final String url;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                for (int i = 0; i < snapshot.data!.length; i++)
                  BooksListItem(aricels: snapshot.data!, index: i)
              ]
                  // snapshot.data!
                  //     .map((e) => BooksListItem(aricels: e))
                  //     .toList(),
//
                  );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }

  Future<List<Aricels>> getdata() async {
    final repo = GetIt.instance<Dio>();
    var respons = await repo.get(url);
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

class BooksListItem extends StatelessWidget {

  const BooksListItem({super.key, required this.aricels, required this.index,this.hight,this.width});
  final List<Aricels> aricels;
  final int index;
  final double? width;
  final double? hight;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        alignment: Alignment.center,
        width:width?? 400,
        height:hight?? 510,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          
          
          children: [
            const SizedBox(
              height: 15,
            ),
            CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.hourglass_empty)),
                fit: BoxFit.fill,
                height: 350,
                width: 300,
                imageUrl: "$baseUrl/media/${aricels[index].fields['image']}"),
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              "${aricels[index].fields['meta']}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "⏱ ${(aricels[index].fields['date'] as String).substring(0, 10)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ButtonReadMore(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PdfPage(
                      articel: aricels,
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
  }
}
