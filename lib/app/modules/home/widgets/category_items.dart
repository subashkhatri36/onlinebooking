import 'package:flutter/material.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/data/model/category_list.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

class CategoryItemList extends StatelessWidget {
  const CategoryItemList({Key? key, required this.e, this.bgcolor})
      : super(key: key);
  final CategoryList e;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: Constants.defaultMargin / 2),
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.defaultPadding,
          vertical: Constants.defaultPadding / 4),
      decoration: BoxDecoration(
          color: bgcolor ?? AppColors.categoryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            e.image,
            fit: BoxFit.fitHeight,
            height: Constants.defaultMargin * 1.5,
          ),
          const SizedBox(
            width: 5,
          ),
          NormalText(
            e.name,
            isBold: true,
            isCentered: true,
          )
        ],
      ),
    );
  }
}
