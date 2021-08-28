import 'package:get/get.dart';
import 'package:tax_task/binding/home_binding.dart';
import 'package:tax_task/binding/more_categories_binding.dart';
import 'package:tax_task/routes/app_routes.dart';
import 'package:tax_task/ui/home/home_screen.dart';
import 'package:tax_task/ui/more_categories/more_categories_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.MORE_CATEGORIES,
      page: () => MoreCategoriesPage(),
      binding: MoreCategoriesBinding(),
    ),
  ];
}
