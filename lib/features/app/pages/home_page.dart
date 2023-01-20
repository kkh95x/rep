import 'dart:convert';

import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/controller/articels/hom_page_articale_cubit.dart';
import 'package:alsallabi/features/app/controller/videos/home_page_video_cubit.dart';
import 'package:alsallabi/features/app/pages/media_photo_page.dart';
import 'package:alsallabi/features/app/pages/media_sound_page.dart';
import 'package:alsallabi/features/app/pages/media_video_page.dart';
import 'package:alsallabi/features/app/pages/salabi_books.dart';
import 'package:alsallabi/features/app/pages/search_page.dart';
import 'package:alsallabi/features/app/pages/tasnefat_fatwa_page.dart';
import 'package:alsallabi/features/app/widgets/bayanat_wa_araa_widget.dart';
import 'package:alsallabi/features/app/widgets/carouse_image_Container_widget.dart';
import 'package:alsallabi/features/app/widgets/carouse_youtub_Container_widget.dart';
import 'package:alsallabi/features/app/widgets/list_of_books_widget.dart';
import 'package:alsallabi/features/app/widgets/list_of_leader_widget.dart';
import 'package:alsallabi/features/app/widgets/list_of_photo.dart';
import 'package:alsallabi/features/app/widgets/list_of_sound.dart';
import 'package:alsallabi/features/app/widgets/list_view_horz_video_widget.dart';
import 'package:alsallabi/features/app/widgets/list_view_horz_widget.dart';
import 'package:alsallabi/features/app/widgets/most_articals_reading.dart';
import 'package:alsallabi/features/app/widgets/most_books_redaing.dart';
import 'package:alsallabi/features/app/widgets/nav_bar_widget.dart';
import 'package:alsallabi/features/app/widgets/person_id_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePAge extends StatefulWidget {
   HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

List<Widget> screens = [
  MainPage(),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/1/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/2/",
  ),
//english
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/3/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/11/",
  ),

  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/4/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/12/",
  ),

  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/5/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/13/",
  ),

  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/6/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/salabibooksarabicBranchPageAPI/14/",
  ),

  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/7/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/15/",
  ),

  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/8/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/16/",
  ),

  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/9/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/17/",
  ),
  const SallabiBooksListPage(
    url: "$baseUrl/api/salabibooksarabicBranchPageAPI/10/",
  ),

  const MediaVideoPage(),
  const MediaPhotoPAge(),
  //ftawa
   TasnefatPage(
    url: "$baseUrl/api/salabiFatwaHukumListBranchPageAPI/1/",
  ),
   TasnefatPage(
    url: "$baseUrl/api/salabiFatwaHukumListBranchPageAPI/2/",
  ),

//almdonat
//الخلفاء الراشدين
   TasnefatPage(
    url: "$baseUrl/api/salabiBloggerListBranchPageAPI/44",
  ),
//مقالات عن كتب
   TasnefatPage(
    url: "$baseUrl/api/salabiBloggerListBranchPageAPI/47",
  ),

   TasnefatPage(
    url: "$baseUrl/api/salabiBloggerListBranchPageAPI/45",
  ),

   TasnefatPage(
    url: "$baseUrl/api/salabiBloggerListBranchPageAPI/48",
  ),
//أولو العزم من الرسل
   TasnefatPage(
    url: "$baseUrl/api/salabiBloggerListBranchPageAPI/46",
  ),
//مقالات

   TasnefatPage(
    url: "$baseUrl/api/salabiBloggerListBranchPageAPI/51",
  ),
  SallabiBayanatWaAraaListPage(
    url: "$baseUrl/api/salabiOpinNotePageAPI/34",
  ),
  SallabiBayanatWaAraaListPage(
    url: "$baseUrl/api/salabiOpinNotePageAPI/35",
  ),
//dr.soluman aooda
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/18/"),
  //dr hassan aqaiel
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/29/"),
  //qardawe
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/19/"),
  //mostafa sbaie
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/31/"),
  //aqazale
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/20/"),
  //sabone
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/32/"),
  //sharawe
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/21/"),
  //basher
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/33/"),
  //tantawe
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/22/"),
  //abdalrzak arade
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/49/"),
  //amad khalil
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/23/"),
  //salah khalide
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/50/"),
  //wasfe ashor
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/24/"),
  //hasan trabe
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/51/"),
//ali kora dage
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/25/"),
//mohamad saleh almonajed
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/52/"),
  //ahmad alraisoone
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/26/"),
  //morad salama
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/53/"),
  //mohamad rateb nabolse
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/27/"),
  //mohamad gazale
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/54/"),
  //abdulwahab trere
  const SallabiBooksListPage(
      url: "$baseUrl/api/salabibooksarabicBranchPageAPI/28/"),

  PersonId(),
  //52
  SizedBox(),
  MediaSoundPage()
];

ValueNotifier<bool> notificationListener = ValueNotifier(true);
String keySearch = "";
bool isMaktab = false;
bool isKtobMtargamh = false;
bool isMedia = false;
bool isFatwaWaHakem = false;
bool isModwnatWabohoth = false;
bool isBayanatWaArai = false;
bool isMaktabaAolmaa = false;

class _HomePAgeState extends State<HomePAge> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: const Text(''),
              ),
              ListTile(
                leading: Text("الرئيسية",
                    style: Theme.of(context).textTheme.displayMedium),
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                    Navigator.of(context).pop();
                  });
                },
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isMaktab = !isMaktab;
                  });
                },
                leading: Text("مكتب الصلابي",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Visibility(
                visible: isMaktab,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("دينية وفكرية",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              Visibility(
                visible: isMaktab,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("تاريخية وسياسية",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 2;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isKtobMtargamh = !isKtobMtargamh;
                  });
                },
                leading: Text("الكتب المترجمة",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Visibility(
                visible: isKtobMtargamh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 3;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الإنكليزية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 4;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الأندنوسية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12)))
                      ],
                    ),
                    //2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 5;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة التركية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 6;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الروسية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12)))
                      ],
                    ),
                    //3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 7;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الفرنسية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 8;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الألبانية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 9;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الهندية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 10;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة البوسنية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 11;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الألمانية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 12;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الأثيوبية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 13;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الأسبانية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 14;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الكردية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 15;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الأيطالية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 16;
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text("اللغة الفارسية",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 12)))
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            pageIndex = 17;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("اللغة البنغالية",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 12)))
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isMedia = !isMedia;
                  });
                },
                leading: Text("الميديا",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Visibility(
                visible: isMedia,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("المكتبة المرئية",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 18;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              Visibility(
                visible: isMedia,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("المكتبة الصوتية",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 53;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              Visibility(
                visible: isMedia,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("مكتبة الصور",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 19;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isFatwaWaHakem = !isFatwaWaHakem;
                  });
                },
                leading: Text("الفتاوي والأحكام",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Visibility(
                visible: isFatwaWaHakem,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("تصنيفات الفتاوى",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 20;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              Visibility(
                visible: isFatwaWaHakem,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("فتاوى العلماء",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 21;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isModwnatWabohoth = !isModwnatWabohoth;
                  });
                },
                leading: Text(" المدونات والبحوث",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Visibility(
                visible: isModwnatWabohoth,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 22;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("سير الخلفاء الراشدين",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 23;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("مقالات عن كتب",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 24;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("سلسة أركان الإيمان",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 25;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("مفكرون ودعاة",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 26;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("سلسة أولو العزم من الرسل",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 27;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("مقالات",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                    ]),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isBayanatWaArai = !isBayanatWaArai;
                  });
                },
                leading: Text("بيانات وآراء",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Visibility(
                visible: isBayanatWaArai,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("بيانات",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 28;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              Visibility(
                visible: isBayanatWaArai,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("آراء",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  onTap: () {
                    setState(() {
                      pageIndex = 29;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isMaktabaAolmaa = !isMaktabaAolmaa;
                  });
                },
                leading: Text("مكتبة العلماء",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Visibility(
                visible: isMaktabaAolmaa,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 30;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د. سمان عودة",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 31;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.عقيل حسين عقيل",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      //2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 32;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د. يوسف القرضاوي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 33;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("مصطفى السباعي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      //3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 34;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("الأمام الغزالي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 35;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("الشيخ محمد علي الصابوني",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 36;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("الشيخ محمد متولي الشعراوي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 37;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.عصام البشير",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 38;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("الشيخ علي الطنطاوي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 39;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("عبدالرزاق العرادي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 40;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.عماد الدين خليل",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 41;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.صلاح الخالدي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 42;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.وصفي عاشور",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 43;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.حسين الترابي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 44;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.علي القره داغي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 45;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("الشيخ محمد صالح المنجد",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 46;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.أحمد الريسوني",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 47;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("الشيخ مراد سلامة",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 48;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.محمد راتب النابلسي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 49;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("الشيخ محمد الغزالي",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  pageIndex = 50;
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text("د.عبدالوهاب الطريري",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 12))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Text("السيرة الذاتية",
                    style: Theme.of(context).textTheme.displayMedium),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                    pageIndex = 51;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBarWidget(
                 
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                SearchPage(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                screens[pageIndex],
                const MostArticalsReading(),
                const MoBooksReading()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
    MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTitleComponent(context, "المقالات"),
        BlocBuilder<HomPageCubit, HomPageArticelsState>(
          builder: (context, state) {
            return state.when(
              initial: () =>  SizedBox(),
              loading: () =>  SizedBox(
                  width: 40, height: 40, child: CircularProgressIndicator()),
              loaded: (aricels) => CarouselSlider(
                  items: [
                    for (int i = 0; i < aricels.length; i++)
                      CarousContainerWidget(
                        aricels: aricels,
                        index: i,
                      )
                  ],
                 
                  options: CarouselOptions(
                      height: 450, autoPlay: true, enlargeCenterPage: true)),
              // loaded: (aricels) => ListVieHorzControler(aricels: aricels),
              error: (error) => const Center(
                child: SizedBox(),
              ),
            );
          },
        ),
        getTitleComponent(context, "المكتبة المرئية"),
        BlocBuilder<HomePageVideoCubit, HomePageVideoState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const SizedBox(
                  width: 40, height: 40, child: CircularProgressIndicator()),
              loaded: (videoModel) =>
                  ListVieHorzVideosControler(videos: videoModel),
              error: (error) => const Center(
                child: SizedBox(),
              ),
            );
          },
        ),
        getTitleComponent(context, "المكتبة المسموعة"),
        SizedBox(
          
             height: 300, child: ListMp3Controller()),
        SizedBox(
          height: 30,
        ),
        getTitleComponent(context, "كتب الصلابي"),
        SizedBox(
            height: 350,
            child: ListVieHorzBooksControler()),
        getTitleComponent(context, "صور الصلابي"),
        SizedBox(
            height: 400,
            child: ListVieHorzPhotoControler()),
        getTitleComponent(context, "مفكرون ودعاة"),
        SizedBox( child: ListVieHorzLederControler())
      ],
    );
  }

  SizedBox getTitleComponent(BuildContext context, String title) {
    return SizedBox(
      height: 84,
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Divider(
            thickness: 4,
            indent: 140,
            endIndent: 140,
          )
        ],
      ),
    );
  }
}
