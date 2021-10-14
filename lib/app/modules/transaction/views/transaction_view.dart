import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/widgets/appbar.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(appTitle: "Transaction History"),
      body: Center(
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
                ),
              ],
            ),
            const Text(
              'TransactionView is working',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
