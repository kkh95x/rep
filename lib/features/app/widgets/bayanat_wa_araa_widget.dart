import 'package:alsallabi/features/app/pages/arcticals_page.dart';
import 'package:alsallabi/features/app/pages/pdf_page.dart';
import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

class SallabiBayanatWaAraaListPage extends StatelessWidget {
  SallabiBayanatWaAraaListPage({super.key, required this.url});
  String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  for (int i=0;i<snapshot.data!.length;i++)
                  BooksListItem(aricels: snapshot.data!,index: i,)

                ],
//                 children: snapshot.data!
//                     .map((e) => BooksListItem(aricels: e))
//                     .toList(),
// //
              );
            } else if (snapshot.hasError) {
              return SizedBox();
            } else {
              return Center(
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
  const BooksListItem({super.key, required this.aricels,required this.index});
  final List<Aricels> aricels;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        alignment: Alignment.center,
        width: 400,
        height: 420,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            CachedNetworkImage(
                fit: BoxFit.fill,
                height: 200,
                width: 300,
                imageUrl: "${aricels[index].fields['image']}"),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(
                textAlign: TextAlign.center,
                "${aricels[index].fields['title']}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              "⏱ ${(aricels[index].fields['datecteated'] as String).substring(0, 10)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            ButtonReadMore(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ArtcalesPage(aricels: aricels,index: index,);
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:alsallabi/features/app/pages/arcticals_page.dart';
// import 'package:alsallabi/features/app/pages/pdf_page.dart';
// import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
// import 'package:alsallabi/features/articles/domain/articles_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get_it/get_it.dart';

// class SallabiBayanatWaAraaListPage extends StatelessWidget {
//   SallabiBayanatWaAraaListPage({super.key, required this.url});
//   String url;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FutureBuilder(
//           future: getdata(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Column(
//                 children: snapshot.data!
//                     .map((e) => BooksListItem(aricels: e))
//                     .toList(),
// //
//               );
//             } else if (snapshot.hasError) {
//               return SizedBox();
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         )
//       ],
//     );
//   }

//   Future<List<Aricels>> getdata() async {
//     final repo = GetIt.instance<Dio>();
//     var respons = await repo.get(url);
//     List<Aricels> list = [];
//     if (respons.statusCode == 200) {
//       for (var x in respons.data) {
//         list.add(Aricels.fromJson(x));
//       }

//       return list;
//     } else {
//       throw Exception(respons.statusMessage);
//     }
//   }
// }

// class BooksListItem extends StatelessWidget {
//   const BooksListItem({super.key, required this.aricels});
//   final Aricels aricels;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40),
//       child: Container(
//         alignment: Alignment.center,
//         width: 400,
//         height: 420,
//         decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.all(Radius.circular(20))),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
//             CachedNetworkImage(
//                 fit: BoxFit.fill,
//                 height: 200,
//                 width: 300,
//                 imageUrl:
//                     "${aricels.fields['image']}"),
//             Container(
//               alignment: Alignment.center,
//               height: 100,
//               child: Text(
//                 textAlign: TextAlign.center,
//                 "${aricels.fields['title']}",
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//             ),
//             Text(
//               "⏱ ${(aricels.fields['datecteated'] as String).substring(0, 10)}",
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ButtonReadMore(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) {
//                     return ArtcalesPage(aricels: aricels);
//                   },
//                 ));
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
