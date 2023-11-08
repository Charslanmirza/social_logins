import 'package:flutter/material.dart';

class CustomRadioButtonWidget extends StatefulWidget {
  String selectedOption;
  final List<Widget> children;

  CustomRadioButtonWidget(
      {super.key, required this.selectedOption, required this.children});

  @override
  State<CustomRadioButtonWidget> createState() =>
      _CustomRadioButtonWidgetState();
}

class _CustomRadioButtonWidgetState extends State<CustomRadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          child: Column(
            children: widget.children,
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     RadioListTile(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          //       controlAffinity: ListTileControlAffinity.trailing,
          //       selectedTileColor: AppColors.primaryColor,
          //       title: CustomTextWidget(
          //         text: 'Most Liked',
          //         colorText: selectedOption == 'Most Liked'
          //             ? AppColors.primaryColor
          //             : Colors.black,
          //         size: 16,
          //         fontWeight: FontWeight.w500,
          //       ),
          //       value: 'Most Liked',
          //       groupValue: selectedOption,
          //       onChanged: _onRadioChanged,
          //       activeColor: AppColors.primaryColor,
          //     ),
          //     RadioListTile(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          //       controlAffinity: ListTileControlAffinity.trailing,
          //       title: CustomTextWidget(
          //         text: 'Trending',
          //         colorText: selectedOption == 'Trending'
          //             ? AppColors.primaryColor
          //             : Colors.black,
          //         size: 16,
          //         fontWeight: FontWeight.w500,
          //       ),
          //       value: 'Trending',
          //       groupValue: selectedOption,
          //       onChanged: _onRadioChanged,
          //       activeColor: AppColors.primaryColor,
          //     ),
          //     RadioListTile(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          //       controlAffinity: ListTileControlAffinity.trailing,
          //       title: CustomTextWidget(
          //         text: 'Latest',
          //         colorText: selectedOption == 'Latest'
          //             ? AppColors.primaryColor
          //             : Colors.black,
          //         size: 16,
          //         fontWeight: FontWeight.w500,
          //       ),
          //       value: 'Latest',
          //       groupValue: selectedOption,
          //       onChanged: _onRadioChanged,
          //       activeColor: AppColors.primaryColor,
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: ButtonWidget(
          //         width: width,
          //         text: "Apply",
          //         buttonType: ButtonType.fill,
          //         color: AppColors.primaryColor,
          //
          //         expand: true,
          //         //   isLoading: submitQuoteController.isSubmittingQuote,
          //         textStyle: const TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w400,
          //             letterSpacing: 0.5),
          //         onPressed: () {
          //           //      submitQuoteController.submitQuote(context);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}
