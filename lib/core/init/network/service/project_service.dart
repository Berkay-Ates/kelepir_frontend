import 'package:dio/dio.dart';

import '../../../../product/constants/baseUrl/base_url.dart';

class ProjectServiceDio {
  //* eager singleton
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
