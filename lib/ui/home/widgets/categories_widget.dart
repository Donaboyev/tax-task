import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_task/controller/home_controller.dart';
import 'package:tax_task/core/theme/app_colors.dart';
import 'package:tax_task/core/theme/app_text_styles.dart';
import 'package:tax_task/ui/home/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = Get.width / 3;
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Categories', style: styCategoryTitle),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Text('More', style: stySearchItemCategory),
                          const Icon(
                            Icons.navigate_next_rounded,
                            color: clrPrimary,
                            size: 32,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: width * 88 / 112,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return CategoryItemWidget(
                      category: category,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
