import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_task/core/theme/app_colors.dart';
import 'package:tax_task/core/theme/app_text_styles.dart';
import 'package:tax_task/data/model/response/categories_response.dart';

class MoreCategoryItemWidget extends StatelessWidget {
  final Category? category;

  const MoreCategoryItemWidget({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: clrWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  child: Container(
                    width: 140,
                    height: 140,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: SvgPicture.string(
                        "&lt;${category!.logoSvg}&gt;",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category!.nameUz ?? category!.name!,
                          style: styMoreCategoryItem,
                          maxLines: 5,
                          overflow: TextOverflow.fade,
                        ),
                        SizedBox(height: 6),
                        Text(
                          category!.createdAt!,
                          style: styMoreCategoryCreated,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: const Icon(
                    Icons.chevron_right,
                    color: clrPrimary,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: clrTransparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
