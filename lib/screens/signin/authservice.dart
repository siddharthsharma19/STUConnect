import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Dio dio = new Dio();
  Future login(usn, password) async {
    try {
      return await dio.post('https://msritstudent.herokuapp.com/authenticate',
          data: {
            "usn": usn,
            "password": password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      print(e.response); //toast or a snackbar
    }
  }
}
