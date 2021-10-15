import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/widgets/appbar.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authorizedAccess(
      Scaffold(
        appBar: appBarWidget(appTitle: "Transaction History"),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    NormalText(
                      "Your Current holding",
                      isBold: true,
                      color: AppColors.grey,
                      fontSize: Constants.defaultFontSize + 5,
                    ),
                    NormalText(
                      "\$36.50 USD",
                      isBold: true,
                      fontSize: Constants.defaultFontSize + 5,
                    ),
                  ],
                ),
                const HeightWidget(h: .04),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const Expanded(
                              child: NormalText(
                            "\$ 45.60 USD",
                            isBold: true,
                            fontSize: Constants.defaultFontSize + 5,
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              NormalText(
                                "Paid on :",
                                color: AppColors.grey,
                              ),
                              WidthWidget(w: .02),
                              NormalText(
                                "17th Aug,2021",
                                isBold: true,
                                fontSize: Constants.defaultFontSize + 5,
                              )
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
