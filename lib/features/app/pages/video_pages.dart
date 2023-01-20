import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/viedos/data/video_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPAge extends StatefulWidget {
  VideoPAge({super.key, required this.videoModel, required this.index});
  List<VideoModel> videoModel;
  int index;

  @override
  State<VideoPAge> createState() => _VideoPAgeState();
}

class _VideoPAgeState extends State<VideoPAge> {
  int index = 0;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  ValueNotifier<bool> videoBuider = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: "${widget.videoModel[index].fields['link']}",
        flags: const YoutubePlayerFlags(
            showLiveFullscreenButton: false,
            hideControls: false,
            forceHD: true,
            controlsVisibleAtStart: true,
            autoPlay: false,
            mute: false,
            disableDragSeek: true,
            enableCaption: true,
            useHybridComposition: true));
    print("${widget.videoModel[index].fields['link']}");
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 300,
                  child: YoutubePlayer(
                    controller: _controller,
                    liveUIColor: Colors.amber,
                    showVideoProgressIndicator: true,
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                
                child: Text(
                  "${widget.videoModel[index].fields['title']}",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "⏱ ${(widget.videoModel[index].fields['datetime'] as String).substring(0, 10)}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: index > 0 ? Colors.white10 : Colors.grey,
                        border:
                            index > 0 ? Border.all(color: Colors.black) : null,
                        borderRadius: BorderRadius.circular(7)),
                    child: TextButton(
                      child: Text("السابق",
                          style: Theme.of(context).textTheme.displaySmall),
                      onPressed: index > 0
                          ? () {
                              _controller.pause();
                              _controller.dispose();
                              index--;
                              Navigator.of(context).pop();

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VideoPAge(
                                    index: index,
                                    videoModel: widget.videoModel),
                              ));
                            }
                          : null,
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: index < widget.videoModel.length - 1
                            ? Colors.white10
                            : Colors.grey,
                        border: index < widget.videoModel.length - 1
                            ? Border.all(color: Colors.black)
                            : null,
                        borderRadius: BorderRadius.circular(7)),
                    child: TextButton(
                      // ignore: sort_child_properties_last
                      child: Text(
                        "التالي",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      onPressed: index < widget.videoModel.length - 1
                          ? () {
                              _controller.pause();
                              _controller.dispose();
                              index++;
Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VideoPAge(
                                    index: index,
                                    videoModel: widget.videoModel),
                              ));
                              
                            }
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "شاهد أيضاَ",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Divider(
                color: Colors.black,

              ),
              SizedBox(
                height: 500,
                child: FutureBuilder(
                    future: getSecondVides(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            VideoModel video = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VideoPAge(
                                    videoModel: snapshot.data!,
                                    index: index,
                                  ),
                                ));
                              },
                              child: SizedBox(
                                  height: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text("${video.fields['title']}")),
                                      const Icon(Icons.open_in_browser),
                                      const Divider()
                                    ],
                                  )),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                            child: Divider(color: Colors.black,),
                          ),
                        );
                        // }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future<List<VideoModel>> getSecondVides() async {
    final repo = GetIt.instance<Dio>();
    var respons = await repo
        .get('$baseUrl/api/videoRelatedPastAPI/${widget.videoModel[index].pk}');
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

class YotubPlayer extends StatefulWidget {
  YotubPlayer({super.key, required this.url});
  String url;
  @override
  State<YotubPlayer> createState() => _YotubPlayerState();
}

class _YotubPlayerState extends State<YotubPlayer> {
  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: "${widget.url}",
        flags: const YoutubePlayerFlags(
            showLiveFullscreenButton: false,
            hideControls: false,
            forceHD: true,
            controlsVisibleAtStart: true,
            autoPlay: false,
            mute: false,
            disableDragSeek: true,
            enableCaption: true,
            useHybridComposition: true));
    super.initState();
  }

  late YoutubePlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.amber,
      showVideoProgressIndicator: true,
    );
  }
}
