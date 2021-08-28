import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_task/controller/more_categories_controller.dart';
import 'package:tax_task/core/custom_widgets/nuts_activity_indicator.dart';
import 'package:tax_task/core/theme/app_colors.dart';
import 'package:tax_task/ui/more_categories/widgets/custom_button_widget.dart';
import 'package:tax_task/ui/more_categories/widgets/more_category_item_widget.dart';

class MoreCategoriesPage extends GetView<MoreCategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrBackground,
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: GetBuilder<MoreCategoriesController>(
          builder: (moreController) => moreController.isLoading.value
              ? const Center(child: const NutsActivityIndicator())
              : Stack(
                  children: [
                    ListView(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) {
                            final category = controller.categories[index];
                            return MoreCategoryItemWidget(category: category);
                          },
                        ),
                        Obx(
                          () => Visibility(
                            visible: !moreController.isCategoryLoading.value &
                                moreController.hastNextCategory.value,
                            child: CustomButtonWidget(
                              onTap: () {
                                moreController.getCategories();
                              },
                              text: 'Show more',
                              margin: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Visibility(
                        visible: moreController.isCategoryLoading.value,
                        child: const Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: const Align(
                            alignment: Alignment.bottomCenter,
                            child: const NutsActivityIndicator(radius: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
