import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


/// Widget that renders a [Button] with transparent or fill background
/// Exposes [onPressed] function
class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final EdgeInsetsGeometry margin;
  final bool isLoading;
  final ButtonType buttonType;
  final Icon? icon;
  final double height;
  final String? appAsset;
  final double? width;
  final bool isIconButton;
  final double radius;
  final bool expand;

  const ButtonWidget(
      {Key? key,
        this.onPressed,
        this.appAsset,
        required this.text,
        this.textStyle,
        this.isIconButton = false,
        this.color = Colors.blueAccent,
        this.margin = EdgeInsets.zero,
        required this.buttonType,
        this.isLoading = false,
        this.icon,
        this.width,
        this.expand = true,
        this.radius = 10.0,
        this.height = 50.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all(getBackgroundColor()),
        foregroundColor: MaterialStateProperty.all(getForegroundColor()),
        side: MaterialStateProperty.all(
          BorderSide(color: color!),
        ),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(radius),
        )));

    return isIconButton
        ? GestureDetector(
        onTap: isLoading ? null : onPressed,
        child: !isLoading
            ? SvgPicture.asset(appAsset!)
            : const SizedBox(
          height: 30.0,
          width: 30.0,
          child: CircularProgressIndicator(
              color: Colors.blue),
        ))
        : Container(
        height: height,
        margin: margin,
        width: width,
        //   width: width ?? (expand ? double.infinity : null),
        child: ElevatedButton.icon(
          icon: icon ?? const SizedBox(),
          style: buttonStyle,
          onPressed: isLoading ? null : onPressed,
          label: !isLoading
              ? Text(
            text,
            style: textStyle,
            textAlign: TextAlign.center,
          )
              : SizedBox(
            height: 30.0,
            width: 30.0,
            child: CircularProgressIndicator(
              color: getProgressIndicatorColor(),
            ),
          ),
        ));
  }

  getForegroundColor() {
    return buttonType == ButtonType.fill ? Colors.white : color ?? Colors.black;
  }

  getBackgroundColor() {
    return buttonType == ButtonType.transparent
        ? Colors.transparent
        : buttonType == ButtonType.white
        ? Colors.white
        : buttonType == ButtonType.fill
        ? color ?? Colors.blue
        : Colors.white;
  }

  getProgressIndicatorColor() {
    return buttonType == ButtonType.fill
        ? Colors.white
        : (color ?? Colors.blue);
  }
}

class CardButton extends StatelessWidget {
  const CardButton(
      {Key? key,
        required this.icon,
        required this.text,
        required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      expand: false,
      text: text,
      buttonType: ButtonType.transparent,
      radius: 100.0,
      height: 413.0,
      onPressed: onPressed,
    );
  }
}

enum ButtonType { transparent, fill, white }
