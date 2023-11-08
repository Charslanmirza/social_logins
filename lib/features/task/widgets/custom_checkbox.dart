import 'package:flutter/material.dart';

class CheckBoxText extends StatelessWidget {
  final String? text;
  final bool
      isChecked; // Add a boolean parameter to determine the checked state
  final ValueChanged<bool?>? onChanged;

  const CheckBoxText({
    Key? key,
    this.text,
    required this.isChecked,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Colors.blueAccent,
          checkColor: Colors.white,
          fillColor: MaterialStatePropertyAll(Colors.blueAccent),
          onChanged: onChanged,
          value:
              isChecked, // Use the isChecked parameter to set the Checkbox state
        ),
        Expanded(
          child: Text(

            text!,
            style: TextStyle(
              decoration: TextDecoration.underline,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
      ],
    );
  }
}
