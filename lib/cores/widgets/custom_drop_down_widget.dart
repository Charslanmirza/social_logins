// import 'package:flutter/material.dart';
//
// import '../styles/colors.dart';
// import 'custom_text_widget.dart';
//
// class CustomDropDownWidget extends StatefulWidget {
//   final bool isTrue;
//   final String? headText;
//   final String? Function(String?)? validator;
//   final Function(String)? onChanged;
//   final String? initialValue;
//   final List<String> items;
//   const CustomDropDownWidget(
//       {Key? key,
//       this.isTrue = false,
//       this.initialValue,
//       this.headText,
//       this.onChanged,
//       this.validator,
//       required this.items})
//       : super(key: key);
//
//   @override
//   State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
// }
//
// class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
//   String? dropdownValue;
//   @override
//   void initState() {
//     super.initState();
//     dropdownValue = widget.initialValue;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.isTrue == true
//         ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomTextWidget(
//                 text: widget.headText,
//                 size: 12,
//                 colorText: AppColors.blackColor,
//                 fontWeight: FontWeight.bold,
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               DropdownButtonFormField(
//                 validator: widget.validator,
//                 hint: const CustomTextWidget(
//                   text: "Select Gender",
//                   colorText: Colors.grey,
//                   size: 12,
//                 ),
//                 value: dropdownValue,
//                 icon: const Icon(Icons.arrow_drop_down),
//                 iconDisabledColor: Colors.grey,
//                 iconEnabledColor: Colors.grey,
//                 decoration: boxContainer("Select Gender"),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     dropdownValue = newValue!;
//                   });
//                   widget.onChanged!(newValue!);
//                 },
//                 items:
//                     widget.items.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: CustomTextWidget(
//                       text: value,
//                       colorText: Colors.black,
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           )
//         : DropdownButtonFormField(
//             decoration: boxContainer("Select Gender"),
//             dropdownColor: Colors.greenAccent,
//             value: dropdownValue,
//             validator: widget.validator,
//             onChanged: (String? newValue) {
//               setState(() {
//                 dropdownValue = newValue!;
//               });
//               widget.onChanged!(newValue!);
//             },
//             items: <String>[
//               'Male',
//               'Female',
//             ].map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: CustomTextWidget(
//                   text: value,
//                   colorText: Colors.black,
//                   size: 14,
//                 ),
//               );
//             }).toList(),
//           );
//   }
//
//   InputDecoration boxContainer(String text) {
//     //   var colorText =borderColor;
//
//     return InputDecoration(
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       errorBorder: OutlineInputBorder(
//         borderSide: const BorderSide(width: 1, color: Colors.red),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: const BorderSide(width: 1, color: Colors.red),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       filled: true,
//       fillColor: Colors.white,
//       hintText: text,
//       hintStyle: const TextStyle(
//           color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(width: 1, color: AppColors.primaryColor),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//       enabledBorder: OutlineInputBorder(
//         borderSide: const BorderSide(width: 1, color: AppColors.primaryColor),
//         borderRadius: BorderRadius.circular(15),
//       ),
//     );
//   }
// }
