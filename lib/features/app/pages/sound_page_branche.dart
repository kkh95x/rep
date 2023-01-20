import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class SoundPlayeBranch extends StatefulWidget {
  const SoundPlayeBranch(
      {super.key, required this.aricels, required this.index});
  final int index;
  final List<Aricels> aricels;

  @override
  State<SoundPlayeBranch> createState() => _SoundPlayeBranchState();
}

class _SoundPlayeBranchState extends State<SoundPlayeBranch> {
  int index = 0;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset("assets/images/mp3.png"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${widget.aricels[index].fields['title']}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Text(
            "⏱ ${(widget.aricels[index].fields['datetime'] as String).substring(0, 10)}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 180,
            height: 40,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
                onPressed: () async {
                  var urllaunchable = await canLaunch(
                      "${widget.aricels[index].fields['link']}"); //canLaunch is from url_launcher package
                  if (urllaunchable) {
                    await launch(
                        "${widget.aricels[index].fields['link']}"); //launch is from url_launcher package to launch URL
                  } else {
                    print("URL can't be launched.");
                  }
                },
                child: Text(
                  "تشغيل الصوت",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                )),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Text(
              "شاهد أيضاً",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Divider(
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
                        border:index < widget.aricels.length - 1
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
             
          FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [for(int i=0;i<snapshot.data!.length;i++)
                    InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      SoundPlayeBranch(aricels: snapshot.data!,index: i,),
                                ));
                              },
                              child: SizedBox(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/mp3.png",
                                        width: 50,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      SizedBox(
                                          child: Text(
                                        "${snapshot.data![i].fields['title']}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      )),
                                    ],
                                  )),
                            )
                        ],
                  );
                  // }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ))),
    );
  }

  Future<List<Aricels>> getData() async {
    final repo = GetIt.instance<Dio>();

    var respons = await repo
        .get('$baseUrl/api/soundRelatedPastAPI/${widget.aricels[index].pk}#');
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
