import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    //await Future.delayed(const Duration(seconds: 1));
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: Headers.formUrlEncodedContentType, //contentType,
            headers: headers ?? {'Authorization': 'Bearer $token'}));

    return response;
  }
}
