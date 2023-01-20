import 'dart:io';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/widgets/most_books_redaing.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get_it/get_it.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key, required this.articel,required this.index}) : super(key: key);

  final List<Aricels> articel;
  final int index;

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  int index=0;
  @override
  void initState() {
    index =widget.index;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CachedNetworkImage(
                  height: 400,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.hourglass_empty),
                    imageUrl: "$baseUrl/media/${widget.articel[index].fields['image']}"),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                textAlign: TextAlign.center,
                "${widget.articel[index].fields['meta']}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "⏱ ${(widget.articel[index].fields['date'] as String).substring(0, 10)}",
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
                        color: index <widget.articel.length - 1
                            ? Colors.white10
                            : Colors.grey,
                        border: index < widget.articel.length - 1
                            ? Border.all(color: Colors.black)
                            : null,
                        borderRadius: BorderRadius.circular(7)),
                    child: TextButton(
                      child: Text(
                        "التالي",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      onPressed: index < widget.articel.length - 1
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
              const SizedBox(height: 30,),
            
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DisplayPDF(
                            
                              url:
                                  "$baseUrl/media/${widget.articel[index].fields['book_file']}")));
                    },
                    child: Text(
                      "فتح",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () async {
                      var urllaunchable = await canLaunch(
                          "$baseUrl/media/${widget.articel[index].fields['book_file']}"); //canLaunch is from url_launcher package
                      if (urllaunchable) {
                        await launch(
                            "$baseUrl/media/${widget.articel[index].fields['book_file']}"); //launch is from url_launcher package to launch URL
                      } else {
                        print("URL can't be launched.");
                      }
                    },
                    child: Text(
                      "تحميل",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    )),
              ),
            
              const MoBooksReading()
            ]),
          ),
        ));
  }

  Future<bool> downloadFile(String url, String fileName, String dir) async {
    Dio dio = GetIt.instance<Dio>();
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: (count, total) {},
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response.headers);
      File file = File("/pdf");
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
    return false;
  }
}

class DisplayPDF extends StatelessWidget {
  const DisplayPDF({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PDF(autoSpacing: true).fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
