import 'package:dio/dio.dart';

class ApiDio {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: "https://xwmjbkvshvoojtwaxklj.supabase.co/rest/v1/",
        headers: {
          "apiKey":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh3bWpia3ZzaHZvb2p0d2F4a2xqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE3ODE4MDQsImV4cCI6MjA1NzM1NzgwNH0.UaajTcSoXHSoFaZUB5I9T8LMyIwtrYWYhRJYcp57GHA",
        }),
  );
  Future<Response> postData({required String path,required Map<String,dynamic>data}) async {
    return await _dio.post(path,data: data);
  }

  Future<Response> getData({required String path}) async {
    return await _dio.get(path);
  }

  Future<Response> putDat({required String path,required Map<String,dynamic>data}) async {
    return await _dio.put(path,data: data);
  }

  Future<Response> delateData({required String path}) async {
    return await _dio.delete(path);
  }
}
