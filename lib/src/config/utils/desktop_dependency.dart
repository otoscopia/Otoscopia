import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';

import 'package:otoscopia/src/config/config.dart';
import 'package:otoscopia/src/core/core.dart';

Future<void> desktopInit() async {
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1000, 700),
    minimumSize: Size(1000, 700),
    title: kAppName,
    center: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  Directory applicationSupport = await getApplicationSupportDirectory();
  applicationDirectory = applicationSupport.path;

  Directory applicationDocuments = await getApplicationDocumentsDirectory();
  documentDirectory = applicationDocuments.path;
}
