import 'package:dio/dio.dart';

class ProjectServiceDio {
  static final ProjectServiceDio _instance = ProjectServiceDio._();
  static ProjectServiceDio get instance => _instance;
  Dio? get dioInstance {
    return _dio;
  }

  late final Dio? _dio;

  ProjectServiceDio._() {
    _dio = Dio(BaseOptions(baseUrl: UrlConstants.baseUrl));
  }
}

abstract class UrlConstants {
  static const String baseUrl = 'https://mobile-pentest.onrender.com';
}
