import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/widgets/most_articals_reading.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtcalesPage extends StatefulWidget {
  ArtcalesPage({super.key, required this.aricels, required this.index});

  final List<Aricels> aricels;
  int index;

  @override
  State<ArtcalesPage> createState() => _ArtcalesPageState();
}

class _ArtcalesPageState extends State<ArtcalesPage> {
  int index = 0;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Expanded(
            child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
               
                child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: 300,
                    imageUrl:
                        "$baseUrl/media/${widget.aricels[index].fields['image']}"),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                textAlign: TextAlign.center,
                "${widget.aricels[index].fields['title']}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "⏱ ${(widget.aricels[index].fields['datecteated'] as String).substring(0, 10)}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: index > 0 ? Colors.white10 : Colors.grey,
                        border: index > 0
                            ? Border.all(color: Colors.black)
                            : null,
                        borderRadius: BorderRadius.circular(7)),
                    child: TextButton(
                      child: Text("السابق",
                          style: Theme.of(context).textTheme.displaySmall),
                      onPressed: index > 0
                          ? () {
                              setState(() {
                                index--;
                              });
                            }
                          : null,
                    ),
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: index < widget.aricels.length - 1
                            ? Colors.white10
                            : Colors.grey,
                        border: index < widget.aricels.length - 1
                            ? Border.all(color: Colors.black)
                            : null,
                        borderRadius: BorderRadius.circular(7)),
                    child: TextButton(
                      // ignore: sort_child_properties_last
                      child: Text(
                        "التالي",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      onPressed: index < widget.aricels.length - 1
                          ? () {
                              print(index);
                              setState(() {
                                index++;
                              });
                            }
                          : null,
                    ),
                  ),
                ],
              ),
             
              const SizedBox(
                height: 20,
              ),
              Html(
                
                style: {"body":Style(fontFamily: "alsllabi_font"),},
                data: "${widget.aricels[index].fields['textvale']}",
                onLinkTap: (url, context, attributes, element)async {
                  if(url!=null){
                     if (await canLaunchUrl(Uri.parse(url))) {
                    // ignore: deprecated_member_use
                    await launchUrl(Uri.parse(url));
                  }
                  }
                },
                
                // onLinkTap: (url) async {
                  
                //   if (await canLaunchUrl(Uri.parse(url!))) {
                //     // ignore: deprecated_member_use
                //     await launchUrl(Uri.parse(url!));
                //   }
                // },
              ),
              const SizedBox(
                height: 30,
              ),
              const MostArticalsReading()
            ],
          ),
        )),
      ),
    ));
  }
}
