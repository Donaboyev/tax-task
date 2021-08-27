import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_task/controller/home_controller.dart';
import 'package:tax_task/ui/home/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = Get.width / 3;
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          height: width * 88 / 112,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var category = controller.categories[index];
                return CategoryItemWidget(
                  category: category,
                  onTap: () {},
                );
              }),
        );
      },
    );
  }
}
