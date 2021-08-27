import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_task/controller/home_controller.dart';
import 'package:tax_task/core/theme/app_colors.dart';
import 'package:tax_task/core/theme/app_text_styles.dart';

class PopularProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = controller.popularProducts[index];
            return Stack(
              children: [
                Container(
                  color: clrWhite,
                  height: 108,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.mxikCode.toString(),
                              style: stySearchItem,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                product.attributeName ??
                                    product.subPositionName!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: stySearchItem,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                product.groupName ?? product.className!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: stySearchItemCategory,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                    ],
                  ),
                ),
                Material(
                  color: clrTransparent,
                  child: InkWell(
                    onTap: () {},
                    child: Ink(
                      height: 108,
                      child: Center(),
                    ),
                  ),
                )
              ],
            );
          },
          childCount: controller.popularProducts.length,
        ),
      ),
    );
  }
}
