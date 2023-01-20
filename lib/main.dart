import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/controller/articels/hom_page_articale_cubit.dart';
import 'package:alsallabi/features/app/controller/videos/home_page_video_cubit.dart';
import 'package:alsallabi/features/articles/domain/articles_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:alsallabi/core/di.dart';
import 'package:alsallabi/features/app/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await initAppModel();
 WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE') // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        title: 'alsallabi',
        theme: ThemeData(
            primaryColor: createMaterialColor(const Color(0xff050561)),
            secondaryHeaderColor: Colors.white,
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontFamily: "alsllabi_font",
                  fontSize: 32,
                  color: Color(0xffFFC641)),
              titleMedium: TextStyle(
                fontFamily: "alsllabi_font",
                fontSize: 16,
                color: Color(0xff007bff),
              ),
              bodySmall: TextStyle(
                  fontFamily: "alsllabi_font",
                  fontSize: 15,
                  color: Colors.white),
              displayMedium: TextStyle(
                  fontFamily: "alsllabi_font",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              displaySmall: TextStyle(
                  fontFamily: "alsllabi_font",
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(
                  fontFamily: "alsllabi_font",
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<HomPageCubit>(
              create: (BuildContext context) =>
                  HomPageCubit()..getMostArticle(),
            ),
            BlocProvider<HomePageVideoCubit>(
              create: (BuildContext context) =>
                  HomePageVideoCubit()..getMostVideo(),
            ),
          ],
          child:  HomePAge(),
        ));
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}