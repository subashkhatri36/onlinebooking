import 'package:flutter/material.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/constant/themes.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

/// custom button which take 4 parameters
/// label,voidcallbarck,bgcolor,textcolor
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Themes.grey,
    this.textColor = Themes.black,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50,
      child: ElevatedButton(
        child: NormalText(label, color: textColor),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor, // background
          //  onPrimary: Colors.white, // foreground/text
          onSurface: Themes.grey, // disabled
          textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: Constants.defaultFontSize,
            // color: Colors.white
            //color: textColor, // f
          ),
        ),
      ),
    );
  }
}

//it will give round shape button
class CustomRoundButton extends StatelessWidget {
  CustomRoundButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.radius = 20.0,
    this.noheight = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final double radius;
  final bool noheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appController.width,
      height: noheight ? null : appController.height * .07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.symmetric(horizontal: radius),
      //alignment: Alignment.center,

      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor:
                  backgroundColor ?? Theme.of(context).primaryColor,
              primary: textColor ?? Themes.textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          child: appController.islandscape.value
              ? FittedBox(
                  child: Text(label),
                )
              : Text(
                  label,
                ),
          onPressed: onPressed),
    );
  }
}

/// custom outlined button widget
class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Themes.grey,
    this.textColor = Themes.black,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: NormalText(label),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        primary: textColor, // foreground
        side: BorderSide(color: backgroundColor), // background
        onSurface: Themes.grey, // disabled
      ),
    );
  }
}

/// custom text button widget
class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.textColor = Themes.black})
      : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: NormalText(
        label,
        color: textColor,
      ),
      onPressed: onPressed,
    );
  }
}
