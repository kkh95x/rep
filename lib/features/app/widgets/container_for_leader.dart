import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/pages/leader_page.dart';
import 'package:alsallabi/features/app/widgets/Button_Read_more.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContainerForLeader extends StatelessWidget {
  const ContainerForLeader({super.key, required this.aricels});
  final Aricels aricels;

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
                    imageUrl:
                        "$baseUrl/media/${aricels.fields['image']}",
                    placeholder: (context, url) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 115, vertical: 100),
                        child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 300,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${aricels.fields['name']}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonReadMore(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LeaderPAge(aricels: aricels),
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
