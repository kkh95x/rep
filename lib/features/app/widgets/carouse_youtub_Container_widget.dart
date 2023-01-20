import 'package:alsallabi/features/app/pages/video_pages.dart';
import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
import 'package:alsallabi/features/viedos/data/video_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CarousYoutubWidget extends StatefulWidget {
  const CarousYoutubWidget(
      {super.key, required this.videoModels, required this.index});
  final List<VideoModel> videoModels;
  final int index;

  @override
  State<CarousYoutubWidget> createState() => _CarousYoutubWidgetState();
}

class _CarousYoutubWidgetState extends State<CarousYoutubWidget> {
  int index = 0;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "${widget.videoModels[index].fields['link']}",
      flags: const YoutubePlayerFlags(
          showLiveFullscreenButton: false,
          hideControls: false,
          forceHD: true,
          controlsVisibleAtStart: true,
          autoPlay: false,
          mute: false,
          disableDragSeek: true,
          enableCaption: true,
          useHybridComposition: true),
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 250,
                width: 400,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: YoutubePlayer(
                    controller: _controller,
                    liveUIColor: Colors.amber,
                    showVideoProgressIndicator: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VideoPAge(videoModel: widget.videoModels,index: index),
                        ));
                  },
                  child: Text(
                    "${widget.videoModels[index].fields['title']}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
