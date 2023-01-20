import 'package:alsallabi/features/app/controller/articels/hom_page_articale_cubit.dart';
import 'package:alsallabi/features/app/widgets/carouse_image_Container_widget.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListVieHorzControler extends StatefulWidget {
  ListVieHorzControler({super.key, required this.aricels});
  final List<Aricels> aricels;

  @override
  State<ListVieHorzControler> createState() => _ListVieHorzControlerState();
}

class _ListVieHorzControlerState extends State<ListVieHorzControler> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.aricels.length + 1,
            controller: controller,
            itemBuilder: (context, index) {
              if (index < widget.aricels.length) {
                return CarousContainerWidget(
                  aricels:widget.aricels,
                  index: index,
                );
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
          Align(
            alignment: Alignment.centerLeft.add(const Alignment(2.1, 0)),
            child: FloatingActionButton(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: const Icon(Icons.arrow_back),
              onPressed: () {
                double bb = (controller.offset - 318);
                if (bb < 0) bb = 0;
                controller.animateTo(bb,
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
            ),
          ),
          Align(
            alignment: Alignment.centerLeft.add(const Alignment(-0.1, 0)),
            child: FloatingActionButton(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: const Icon(Icons.arrow_forward),
              onPressed: () async {
                if (controller.offset == controller.position.maxScrollExtent) {
                  var data = await BlocProvider.of<HomPageCubit>(context)
                      .getPreArticles("${widget.aricels[widget.aricels.length - 1].pk}");
                  if(data!=[]){
setState(() {
  widget.aricels.addAll(data);
});
                  }
                  
                }
                controller.animateTo((controller.offset + 318),
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
            ),
          )
        ],
      ),
    );
  }
}
