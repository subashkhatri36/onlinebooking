import 'package:flutter/material.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

class TrandingListItems extends StatelessWidget {
  const TrandingListItems({
    Key? key,
    required this.bookname,
    required this.authorname,
    this.backgroundColor = Colors.blueAccent,
    this.bookImage =
        "https://images-na.ssl-images-amazon.com/images/I/81dQwQlmAXL.jpg",
  }) : super(key: key);
  final String bookname;
  final String authorname;
  final Color backgroundColor;
  final String bookImage;

  @override
  Widget build(BuildContext context) {
    String image = // bookImage.isEmpty
        "https://images-na.ssl-images-amazon.com/images/I/81dQwQlmAXL.jpg";
    //: bookImage;
    return Container(
      width: (appController.width * .4),
      margin:
          const EdgeInsets.symmetric(horizontal: Constants.defaultPadding / 3),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: (appController.width * .4),
              height: (appController.height * .4) / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Constants.defaultRadius),
                  color: backgroundColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NormalText(bookname,
                        isCentered: true,
                        isBold: true,
                        maxline: 1,
                        fontSize: Constants.defaultFontSize + 5),
                    NormalText(authorname,
                        isCentered: true,
                        maxline: 1,
                        fontSize: Constants.defaultFontSize + 3),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: SizedBox(
              width: (appController.width * .4),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                      width: (appController.width * .30),
                      height: (appController.height * .24),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
