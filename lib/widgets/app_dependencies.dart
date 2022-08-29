import 'package:flutter/material.dart';

import '/controllers/home_controller.dart';
import '/services/http_package_client.dart';
import '/services/json_placeholder_service.dart';

class AppDependencies extends InheritedWidget {
  final HomeController controller;
  final JsonPlaceholderService service;
  final HttpPackageClient httpPackageClient;

  const AppDependencies({
    Key? key,
    required super.child,
    required this.controller,
    required this.service,
    required this.httpPackageClient,
  }) : super(key: key);

  static AppDependencies? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>();
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return httpPackageClient != oldWidget.httpPackageClient &&
        service != oldWidget.service &&
        controller != oldWidget.controller;
  }
}
