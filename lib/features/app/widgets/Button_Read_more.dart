import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ButtonReadMore extends StatelessWidget {
  const ButtonReadMore({super.key,required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(20)),
      child: TextButton(onPressed: onPressed, child: Text("أقرأ المزيد",style:Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white) ,)),
    );

  }
}