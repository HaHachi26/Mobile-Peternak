import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // unawaited(MobileAds.instance.initialize());
  await GetStorage.init();
  final box = GetStorage();
  Intl.defaultLocale = 'id_ID';
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(
      GetMaterialApp(
        title: "Application",
        initialRoute:
            box.read("token") == null ? AppPages.INITIAL : Routes.NAVIGATION,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
    print(box.read("token"));
  });
}
