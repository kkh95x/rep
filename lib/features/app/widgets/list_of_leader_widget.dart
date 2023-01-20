import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/widgets/container_for_leader.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListVieHorzLederControler extends StatefulWidget {
  ListVieHorzLederControler({super.key});

  @override
  State<ListVieHorzLederControler> createState() =>
      _ListVieHorzLederControlerState();
}

class _ListVieHorzLederControlerState extends State<ListVieHorzLederControler> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Future<List<Aricels>> getLeaders() async {
    final repo = GetIt.instance<Dio>();

    var respons = await repo.get('$baseUrl/api/salabiLeaderAPI/');
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          FutureBuilder(
              future: getLeaders(),
              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ContainerForLeader(aricels: snapshot.data![index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: SizedBox(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}
