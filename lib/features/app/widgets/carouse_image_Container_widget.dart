import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/arcticals_page.dart';
import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarousContainerWidget extends StatelessWidget {
   CarousContainerWidget({super.key, required this.aricels,required this.index});
   List<Aricels> aricels;
   int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 200,
                width: 300,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "$baseUrl/media/${aricels[index].fields['image']}",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${aricels[index].fields['title']}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonReadMore(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtcalesPage(aricels: aricels,index: index,),
                      ));
                },
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

// import 'package:alsallabi/features/app/constants/constant.dart';
// import 'package:alsallabi/features/app/pages/arcticals_page.dart';
// import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
// import 'package:alsallabi/features/articles/domain/articles_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class CarousContainerWidget extends StatelessWidget {
//   const CarousContainerWidget({super.key, required this.aricels});
//   final Aricels aricels;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: const BorderRadius.all(Radius.circular(20))),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 height: 200,
//                 width: 300,
//                 child: ClipRRect(
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(20)),
//                   child: CachedNetworkImage(
//                     fit: BoxFit.cover,
//                     imageUrl:
//                         "$baseUrl/media/${aricels.fields['image']}",
//                     placeholder: (context, url) =>const Center(child:  CircularProgressIndicator()),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 300,
//                 height: 80,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     "${aricels.fields['title']}",
//                     style: Theme.of(context).textTheme.titleMedium?.copyWith(),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ButtonReadMore(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ArtcalesPage(aricels: aricels),
//                       ));
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

