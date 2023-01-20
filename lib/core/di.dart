import 'package:alsallabi/features/app/data/dio_repository_home.dart';
import 'package:alsallabi/features/app/data/repository_home.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final instance = GetIt.instance;

Future<void> initAppModel() async {

  instance.registerLazySingleton<Dio>((() => Dio()));
  
  instance.registerLazySingleton<HomeRepository>((() => DioHomeRepository(instance<Dio>())));

  
}