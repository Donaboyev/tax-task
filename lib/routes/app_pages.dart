import 'package:get/get.dart';
import 'package:tax_task/binding/home_binding.dart';
import 'package:tax_task/routes/app_routes.dart';
import 'package:tax_task/ui/home/home_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
