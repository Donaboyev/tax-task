import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tax_task/controller/home_controller.dart';
import 'package:tax_task/core/custom_widgets/flappy_search_bar/flappy_search_bar.dart';
import 'package:tax_task/core/custom_widgets/flappy_search_bar/search_bar_style.dart';
import 'package:tax_task/core/custom_widgets/nuts_activity_indicator.dart';
import 'package:tax_task/core/theme/app_colors.dart';
import 'package:tax_task/core/theme/app_text_styles.dart';
import 'package:tax_task/data/model/response/products_response.dart';
import 'package:tax_task/ui/home/widgets/categories_widget.dart';
import 'package:tax_task/ui/home/widgets/search_item_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => homeController.isLoading.value
          ? Center(child: NutsActivityIndicator())
          : KeyboardDismisser(
              child: Scaffold(
                backgroundColor: clrBackground,
                body: SafeArea(
                  child: SearchBar<Product>(
                    onError: (error) => Center(
                      child: Text(
                        'No data found',
                        style: styNotFound,
                      ),
                    ),
                    searchBarStyle: SearchBarStyle(
                      borderRadius: BorderRadius.circular(12),
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    ),
                    hintText: 'Search',
                    hintStyle: stySearchItem.copyWith(color: clrGray),
                    textStyle: stySearchItem,
                    cancellationWidget: Text(
                      'Cancel',
                      maxLines: 1,
                      style: stySearchItem,
                      textAlign: TextAlign.center,
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.search),
                    ),
                    loader: NutsActivityIndicator(),
                    listPadding: EdgeInsets.all(12),
                    onSearch: homeController.searchProduct,
                    onItemFound: (product, index) =>
                        SearchItemWidget(products: product, onTap: () async {}),
                    searchBarController: homeController.searchBarController,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    placeHolder: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (_, index) => CategoriesWidget(),
                            childCount: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
