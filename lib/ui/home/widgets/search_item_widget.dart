import 'package:flutter/material.dart';
import 'package:tax_task/core/theme/app_colors.dart';
import 'package:tax_task/core/theme/app_text_styles.dart';
import 'package:tax_task/data/model/response/products_response.dart';

class SearchItemWidget extends StatelessWidget {
  final Product? products;
  final VoidCallback? onTap;

  SearchItemWidget({Key? key, this.products, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 102,
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
                      products!.mxikCode.toString(),
                      style: stySearchItem,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        products!.attributeName ?? products!.subPositionName!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: stySearchItem,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        products!.groupName ?? products!.className!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: stySearchItemCategory,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 72),
                child: Divider(height: 1),
              ),
            ],
          ),
        ),
        Material(
          color: clrTransparent,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              height: 102,
              child: Center(),
            ),
          ),
        )
      ],
    );
  }
}
