import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_task/binding/home_binding.dart';
import 'package:tax_task/core/constants/app_constants.dart';
import 'package:tax_task/data/network/api_client.dart';
import 'package:tax_task/routes/app_pages.dart';
import 'package:tax_task/routes/app_routes.dart';
import 'package:tax_task/ui/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (AppConstants.RUNNING == Version.WAIT) await HomeBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      navigatorKey: ApiClient.alice.getNavigatorKey(),
      getPages: AppPages.pages,
      defaultTransition: Transition.rightToLeft,
      home: HomePage(),
    );
  }
}
