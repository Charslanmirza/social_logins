// import 'package:dis_mobile_app/core/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../styles/colors.dart';
// import 'custom_text_widget.dart';
//
// class CustomDatePickerWidget extends StatefulWidget {
//   CustomDatePickerWidget(
//       {Key? key,
//       this.title,
//       this.isTrue = false,
//       this.headText,
//       this.validator,
//         this.firstDate,
//       this.initialDate,
//         this.lastDate,
//         this.width,
//       required this.onDateChange})
//       : super(key: key);
//
//   final double? width;
//   final String? title;
//   final bool isTrue;
//   final String? headText;
//   final DateTime? initialDate;
//   final DateTime? lastDate;
//   final DateTime? firstDate;
//   final ValueChanged<DateTime> onDateChange;
//   final String? Function(String?)? validator;
//
//   @override
//   State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
// }
//
// class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
//   DateTime? selectedDate;
//   TextEditingController? dobController = TextEditingController();
//
//   _selectDate(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime(2005),
//       firstDate: widget.firstDate ?? DateTime(1900),
//       lastDate: widget.lastDate ?? DateTime(3000),
//     );
//     if (selected != null && selected != selectedDate) {
//       setState(() {
//         selectedDate = selected;
//         widget.onDateChange(selected);
//         dobController!.text = getConvertedDate(selected);
//         build(context);
//       });
//     }
//   }
//
//   String getConvertedDate(DateTime now) {
//     //var now = new DateTime.now();
//     var formatter = datePickerFormat;
//     String formattedDate = formatter.format(now);
//     return formattedDate;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     selectedDate = widget.initialDate;
//     dobController!.text =selectedDate != null ?  getConvertedDate(selectedDate!) : 'Select Date';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: widget.width,
//       child: widget.isTrue == true
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomTextWidget(
//                   text: widget.headText,
//                   size: 12,
//                   colorText: AppColors.blackColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                     validator: widget.validator,
//                     controller: dobController!,
//                     onTap: () => _selectDate(context),
//                     cursorColor: AppColors.blackColor,
//                     style: const TextStyle(color: Colors.black, fontSize: 14),
//                     autofocus: false,
//                     readOnly: true,
//                     decoration: boxContainer(widget.title!)),
//               ],
//             )
//           : TextFormField(
//               validator: widget.validator,
//               controller: dobController,
//               onTap: () => _selectDate(context),
//               cursorColor: AppColors.blackColor,
//               style: const TextStyle(color: Colors.black),
//               autofocus: false,
//               readOnly: true,
//               decoration: boxContainer(widget.title!)),
//     );
//   }
//
//   InputDecoration boxContainer(String text) {
//     //   var colorText =borderColor;
//
//     return InputDecoration(
//       errorBorder: OutlineInputBorder(
//         borderSide: const BorderSide(width: 1, color: Colors.red),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: const BorderSide(width: 1, color: Colors.red),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       suffixIcon: const Icon(
//         Icons.calendar_month_outlined,
//         color: Colors.grey,
//       ),
//       filled: true,
//       fillColor: Colors.white,
//       hintText: "DD/MM/YYYY",
//       hintStyle: const TextStyle(
//           color: Colors.grey, fontSize: 12, fontFamily: 'Arimo'),
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
