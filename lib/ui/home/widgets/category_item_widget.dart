import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tax_task/core/theme/app_colors.dart';
import 'package:tax_task/core/theme/app_text_styles.dart';
import 'package:tax_task/data/model/response/categories_response.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category? category;
  final VoidCallback? onTap;

  const CategoryItemWidget({Key? key, this.category, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Get.width / 2;
    return Container(
      width: width,
      height: width * 88 / 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: clrWhite,
      ),
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: (width * 88 / 112 - 80),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: SvgPicture.string(
                        "&lt;${category!.logoSvg}&gt;",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 4,
                    ),
                    child: Text(
                      category!.nameUz ?? category!.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: clrTransparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
