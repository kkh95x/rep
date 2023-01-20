import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/widgets/most_articals_reading.dart';
import 'package:alsallabi/features/app/widgets/nav_bar_widget.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';

class PersonId extends StatelessWidget {
  PersonId({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(9),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Html(

                      
                      //  style: {"p":Style(fontFamily: "alsllabi_font",lineHeight: LineHeight.number(2)),},
                      data: "${snapshot.data![0].fields['description']}",
                      onLinkTap: (url, context, attributes, element) async {
                        if(url!=null){
                        if (await canLaunchUrl(Uri.parse(url))) {
                          // ignore: deprecated_member_use
                          await launchUrl(Uri.parse(url));
                        }}
                      },
                    ),
                    
                  ],
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
        );
  }

  Future<List<Aricels>> getData() async {
    final repo = GetIt.instance<Dio>();
    var respons =
        await repo.get('$baseUrl/api/salabiPersonalInfoAPI/');
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
