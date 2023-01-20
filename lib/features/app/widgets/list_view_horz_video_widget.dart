import 'package:alsallabi/features/app/data/repository_home.dart';
import 'package:alsallabi/features/app/widgets/carouse_youtub_Container_widget.dart';

import 'package:alsallabi/features/viedos/data/video_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListVieHorzVideosControler extends StatefulWidget {
  ListVieHorzVideosControler({super.key, required this.videos});
  List<VideoModel> videos;

  @override
  State<ListVieHorzVideosControler> createState() =>
      _ListVieHorzVideosControlerState();
}

class _ListVieHorzVideosControlerState
    extends State<ListVieHorzVideosControler> {
  final ScrollController controller = ScrollController();
  var data = [];
  bool isNext = true;
  bool showNext = true;
  bool showPast = true;

  _bind() {
    data = widget.videos;
    controller.addListener(() async {
    
      if (controller.offset == (controller.position.maxScrollExtent)) {
        final repo = GetIt.instance<HomeRepository>();

        var respons = await repo.getPreVideos("${data[data.length - 1].pk}");

        List<VideoModel> list = [];

        for (var x in respons) {
          list.add(VideoModel.fromJson(x));
        }
        if (list != []) {
          data = data + list;
          isNext = true;
        }

        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length ,
            controller: controller,
            itemBuilder: (context, index) {
              if (index < data.length) {
                return CarousYoutubWidget(
                  videoModels: data as List<VideoModel>,
                  index: index,
                );
              } else {
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        //   Visibility(
        //     visible: showPast,
        //     child: Align(
        //       alignment: Alignment.centerLeft.add(const Alignment(2.1, 0)),
        //       child: FloatingActionButton(
        //         backgroundColor: Colors.black.withOpacity(0.5),
        //         child: const Icon(Icons.arrow_back),
        //         onPressed: () {
        //           double bb = (controller.offset - 318);
        //           if (bb < 0) bb = 0;
        //           controller.animateTo(bb,
        //               duration: const Duration(seconds: 1), curve: Curves.ease);
        //         },
        //       ),
        //     ),
        //   ),
        //   Visibility(
        //     visible: showNext,
        //     child: Align(
        //       alignment: Alignment.centerLeft.add(const Alignment(-0.1, 0)),
        //       child: FloatingActionButton(
        //         backgroundColor: Colors.black.withOpacity(0.5),
        //         child: const Icon(Icons.arrow_forward),
        //         onPressed: () async {
                 
        //           controller.animateTo((controller.offset + 318),
        //               duration: const Duration(seconds: 1), curve: Curves.ease);
        //         },
        //       ),
        //     ),
        //   )
         ],
      ),
    );
  }
}
