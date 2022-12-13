import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIConstants {
  static const String API_BASE_URL =
      "https://noorulhudatrading.com/hps_vr_admin/api";
}

class Api002 {
  Dio _dio = Dio();

  Api002() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}
