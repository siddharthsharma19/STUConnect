import 'package:dio/dio.dart';

class SisData {
  Dio dio = new Dio();
  Future getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://msSTUConnect.herokuapp.com/getinfo');
  }
}
