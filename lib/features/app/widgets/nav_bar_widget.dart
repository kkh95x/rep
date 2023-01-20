import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';


class NavBarWidget extends StatelessWidget {
  NavBarWidget(
      {super.key,
      required this.onTap,
      });
  final void Function() onTap;
  String locale = 'ar';

  HijriCalendar _today = HijriCalendar.now();
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
FocusScope.of(context).unfocus();

      },
      child: Container(
        color: Theme.of(context).primaryColor,
        width: size.width,
        height: 460,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 10,
          ),
          soicalMediaRow(),
          const SizedBox(
            height: 10,
          ),
          Text(
            " ${getNAmeDay(now.weekday)}  ${_today.toFormat("dd-mm-yyyy")}  |   ${formatter.format(now)}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          myAppBar(size, context),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: Image.asset(
              "assets/images/logo-mob.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  String getNAmeDay(int daynumber) {
    switch (daynumber) {
      case 6:
        return "السبت";
      case 7:
        return "الأحد";
      case 1:
        return "الأثنين";
      case 2:
        return "الثلاثاء";
      case 3:
        return "الأربعاء";
      case 4:
        return "الخميس";
      case 5:
        return "الجمعة";

      default:
        return "";
    }
  }

  Container myAppBar(Size size, BuildContext context) {
    return Container(
      width: size.width,
      height: 50,
      color: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              onTap: onTap,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4)),
                  child: Icon(
                    Icons.list,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Row soicalMediaRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSocialMediaIcon(
            path: "assets/images/telegram.png", url: "https://t.me/alsallabi"),
        getSocialMediaIcon(
            path: "assets/images/youtube.png",
            url: "https://www.youtube.com/alsallabicom"),
        getSocialMediaIcon(
            path: "assets/images/instagram.png",
            url: "https://www.instagram.com/dr.ali_alsallabi"),
        getSocialMediaIcon(
            path: "assets/images/tiwter.png",
            url: "https://twitter.com/alsallabi1"),
        getSocialMediaIcon(
            path: "assets/images/facebook.png",
            url: "https://www.facebook.com/Dr.sallabi")
      ],
    );
  }

  Widget getSocialMediaIcon({required String path, required String url}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () async {
          // ignore: deprecated_member_use
          if (await canLaunch(url)) {
            // ignore: deprecated_member_use
            await launch(url);
          }
        },
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          child: SizedBox(
              child: Image.asset(
            path,
          )),
        ),
      ),
    );
  }
}
