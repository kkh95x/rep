import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/arcticals_page.dart';
import 'package:alsallabi/features/app/widgets/most_articals_reading.dart';
import 'package:alsallabi/features/app/widgets/most_books_redaing.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

class LeaderPAge extends StatelessWidget {
  const LeaderPAge({super.key, required this.aricels});

  final Aricels aricels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
          padding: EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  child: CachedNetworkImage(
                      imageUrl:
                          "$baseUrl/media/${aricels.fields['image']}"),
                ),
                const SizedBox(
                  height: 50,
                  child: Divider(),
                ),
                Text(
                  "${aricels.fields['name']}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${aricels.fields['part']}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 30,),
                MostArticalsReading(),
                MoBooksReading()
              ],
            ),
          ),
              ),
            ),
        ));
  }

 
}
