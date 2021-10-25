import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/widgets/ad_mob_widget.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/bookread_controller.dart';

class BookreadView extends GetView<BookreadController> {
  final argument = Get.arguments;
  BookreadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authorizedAccess(
      Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.keyboard_backspace,
                color: AppColors.black,
              ),
            ),
            title: NormalText(
              '${argument[0]}',
              color: AppColors.black,
              isBold: true,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.white,
          ),
          body: Padding(
              padding: const EdgeInsets.all(Constants.defaultPadding),
              child: argument[1].isNotEmpty
                  ? Column(
                      children: [
                        Expanded(child: SfPdfViewer.network(argument[1])),
                        const AdmobBannerAdWidget(),
                      ],
                    )
                  : Container())),
    );
  }
}
