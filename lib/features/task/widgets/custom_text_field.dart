import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom [TextFormField] for this app to allow
/// for uniform design changes throughout the app.
class CustomTextField extends StatelessWidget {
  final String? text;
  final double size;
  final String? headText;
  final String? label;
  final FontWeight fontWeight;
  final Color? color;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final String? initialValue;
  final bool borderEnable;
  final bool istrue;
  final Widget? prefixIcon;
  final double? width;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool obscureText;
  final bool isDescriptionEnabled;
  final List<TextInputFormatter>? inputFormatters;

  CustomTextField(
      {Key? key,
      @required this.text,
      this.initialValue,
      this.obscureText = false,
      this.width,
      this.focusNode,
      this.istrue = false,
      this.label,
      this.readOnly = false,
      this.headText,
      this.inputFormatters,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.size = 14,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.validator,
      this.prefixIcon,
      this.controller,
      this.borderEnable = false,
      this.isDescriptionEnabled = false,
      this.onChanged})
      : super(key: key);

  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
          initialValue: initialValue,
          validator: validator,
          cursorColor: Colors.black,
          readOnly: readOnly,
          style: TextStyle(color: color ?? Colors.grey, fontSize: 14),
          autofocus: false,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          maxLines: obscureText ? 1 : (isDescriptionEnabled ? 5 : null),
          controller: controller,
          obscureText: obscureText,
          decoration: boxContainer(text!),
          onChanged: onChanged),
    );
  }

  InputDecoration boxContainer(String hintText) {
    return InputDecoration(
      contentPadding: istrue
          ? const EdgeInsets.symmetric(horizontal: 0, vertical: 0)
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      // Adjust the value as needed

      labelText: label,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(.8),
      ),
      prefixIcon: prefixIcon,
      prefixIconColor: Colors.black,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.black.withOpacity(.6),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      // Set alignLabelWithHint based on maxLines
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.green,
        ),
        borderRadius:
        istrue ? BorderRadius.circular(20) : BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color:  Colors.grey.withOpacity(.2),
        ),
        borderRadius:
        istrue ? BorderRadius.circular(20) : BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.white,
        ),
        borderRadius:
        istrue ? BorderRadius.circular(20) : BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.white,
        ),
        borderRadius:
        istrue ? BorderRadius.circular(20) : BorderRadius.circular(12),
      ),
      // enabledBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(
      //     width: 1,
      //     color: const Color(0xffDE9146).withOpacity(0.2),
      //   ),
      //   borderRadius:
      //   istrue ? BorderRadius.circular(20) : BorderRadius.circular(12),
      // ),
    );
  }
}

/// [TextFormField] build on top of [CustomTextField], to handle
/// [obscureText] property. User can tap on icon button in the suffix to
/// show or hide password.
///
class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    this.width,
    this.labelText,
    this.initialValue,
    this.validator,
    this.label,
    this.borderEnable = false,
    this.onChanged,
  }) : super(key: key);

  final String? initialValue;
  final Function(String?)? onChanged;
  final bool borderEnable;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? label;
  final double? width;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: widget.label,
      width: widget.width,
      text: 'Password',
      headText: widget.labelText,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      borderEnable: widget.borderEnable,
      validator: widget.validator,
      obscureText: showPass,
      istrue: false,
      suffixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              showPass = !showPass;
            });
          },
          child: Icon(
            showPass
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 24,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
