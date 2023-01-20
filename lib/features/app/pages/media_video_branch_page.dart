import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/widgets/carouse_youtub_Container_widget.dart';
import 'package:alsallabi/features/viedos/data/video_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

class MediaVideoBranch extends StatelessWidget {
  const MediaVideoBranch({super.key, required this.pk});
  final String pk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CarousYoutubWidget(videoModels: snapshot.data!,index: index,);
              },
            );
          } else if (snapshot.hasError) {
            return const SizedBox();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }

  Future<List<VideoModel>> getdata() async {
    final repo = GetIt.instance<Dio>();
    var respons =
        await repo.get("$baseUrl/api/salabiVideoPageAPI/$pk");
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
}
