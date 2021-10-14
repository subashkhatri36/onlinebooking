import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/text/header_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';
import 'package:onlinebooks/app/widgets/text/two_color_text.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({
    Key? key,
    this.booklistmodel,
    this.scroll = false,
  }) : super(key: key);
  final List<BookDetailInfo>? booklistmodel;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: Constants.defaultPadding / 2),
      child: booklistmodel == null
          ? const Center(
              child: NormalText("No data to show"),
            )
          : ListView.separated(
              physics: scroll ? null : const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const Divider();
              },
              shrinkWrap: true,
              itemCount: booklistmodel!.length,
              itemBuilder: (context, index) {
                BookDetailInfo e = booklistmodel![index];
                return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.bookdescription, arguments: e.id);
                    },
                    child: BookListItems(e: e, index: index));
              },
            ),
    );
  }
}

class BookListItems extends StatelessWidget {
  const BookListItems({
    Key? key,
    required this.e,
    required this.index,
  }) : super(key: key);

  final BookDetailInfo e;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(Routes.bookdescription, arguments: e.id);
      },
      isThreeLine: true,
      leading: SizedBox(
        height: appController.height * .4,
        width: appController.width * .17,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: e.coverPhoto.isEmpty
                ? Image.asset(
                    AppImage.appLogo,
                    height: appController.height * .4,
                    width: appController.width * .2,
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    e.coverPhoto,
                    height: appController.height * .4,
                    width: appController.width * .2,
                    fit: BoxFit.fill,
                  )),
      ),
      title: HeaderText(
        e.title,
      ),
      subtitle: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NormalText(
              //   'A book About hope',
              //   isBold: true,
              //   isCentered: true,
              // ),
              NormalText(
                "Author : ${e.author}",
                isBold: true,
              ),
              TwoColorText(
                'Snopsis :',
                e.synopsis,
                isBold: true,
              ),
              // NormalText(
              //     " Snopsis : Here is the description Here is the description Here is the description Here is the descriptionHere is the description Here is the description Here is the descriptionHere is the description Here is the description"),
            ],
          ),
          if (e.synopsis.length > 100)
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  //  Get.toNamed(Routes.bookread, arguments: [id]);
                },
                child: const NormalText(
                  'Read More',
                  color: AppColors.blue,
                ),
              ),
            )
        ],
      ),
    );
  }
}
