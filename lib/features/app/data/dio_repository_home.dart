import 'package:alsallabi/features/app/constants/constant.dart';
import 'package:alsallabi/features/app/data/repository_home.dart';
import 'package:dio/dio.dart';

class DioHomeRepository implements HomeRepository {
  Dio dio;
  DioHomeRepository(this.dio);
  @override
  Future<dynamic> getListAricels(String url) async {
    try {
      var response = await dio
          .get(url);
      if (response.statusCode == 200) {
        
        return response.data ;
      } else {
        throw Exception("Data Erorr");
      }
    } catch (e) {
      

      throw Exception("Server Error");
    }
  }
    @override
  Future<dynamic> getPreArticals(String pk) async {
    try {
      var response = await dio
          .get("h$baseUrl/api/articleRelatedPreAPI/$pk");
      if (response.statusCode == 200) {
        
        return response.data ;
      } else {
        throw Exception("Data Erorr");
      }
    } catch (e) {
      

      throw Exception("Server Error");
    }
  }
  
  @override
  Future getPreVideos(String pk)async {
     try {
      var response = await dio
      
          .get("$baseUrl/api/videoRelatedPreAPI/$pk");
      if (response.statusCode == 200) {
        
        return response.data ;
      } else {
        throw Exception("Data Erorr");
      }
    } catch (e) {
      

      throw Exception("Server Error");
    }
   
  }
}
