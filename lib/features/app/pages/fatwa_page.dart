import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/arcticals_page.dart';
import 'package:alsallabi/features/app/pages/media_video_branch_page.dart';
import 'package:alsallabi/features/app/widgets/carouse_image_Container_widget.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

class FatawPage extends StatelessWidget {
   FatawPage({super.key,required this.pk});
  final int pk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    for(int i=0;i<snapshot.data!.length;i++)
                    CarousContainerWidget(aricels: snapshot.data!,index: i,)
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
        ),
      ),
    );
  }

  Future<List<Aricels>> getData() async {
    final repo = GetIt.instance<Dio>();
    var respons =
        await repo.get('$baseUrl/api/salabiFatwaHukumBranchPageAPI/$pk');
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
// import 'package:alsallabi/features/app/constants/constant.dart';
// import 'package:alsallabi/features/app/pages/arcticals_page.dart';
// import 'package:alsallabi/features/app/pages/media_video_branch_page.dart';
// import 'package:alsallabi/features/app/widgets/carouse_image_Container_widget.dart';
// import 'package:alsallabi/features/articles/domain/articles_model.dart';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// import 'package:get_it/get_it.dart';

// class FatawPage extends StatelessWidget {
//   const FatawPage({super.key,required this.pk});
//   final int pk;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: FutureBuilder(
//             future: getData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                     children: snapshot.data!
//                         .map((e) => Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: CarousContainerWidget(aricels: e,),
//                             ))
//                         .toList());
//               } else if (snapshot.hasError) {
//                 return const SizedBox();
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Future<List<Aricels>> getData() async {
//     final repo = GetIt.instance<Dio>();
//     var respons =
//         await repo.get('$baseUrl/api/salabiFatwaHukumBranchPageAPI/$pk');
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

