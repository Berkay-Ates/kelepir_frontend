import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kelepir/core/init/navigation/navigation_service.dart';

import '../init/network/service/project_service.dart';

abstract class IBaseView {
  late BuildContext buildContext;
  NavigationService navigationService = NavigationService.instance;
  Dio? projectDio = ProjectServiceDio.instance.dioInstance;
  //* service objemiz var bu service objesi onune get post isteklerini de eklemek gerekecek
  //* sadece dio uzerinden service isteklerini yapmak olmaz

  void setContext(BuildContext context);
  void init();
}
