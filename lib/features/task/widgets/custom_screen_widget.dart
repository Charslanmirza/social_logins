import 'package:flutter/material.dart';

class CustomScreenWidget extends StatelessWidget {
  final List<Widget> children;
  final Widget? drawer;
  final bool isDrawerEnabled;
  final String? titleText;
  final List<Widget>? actions;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  CustomScreenWidget(
      {Key? key,
      this.drawer,
      this.titleText,
      this.actions,
      this.isDrawerEnabled = false,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 70;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            child: Padding(
              padding: EdgeInsets.all(22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );

    // Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Padding(
    //       padding: const EdgeInsets.all(12.0),
    //       child: Stack(
    //         children: [
    //           Positioned(
    //             top: height * .20,
    //             left: width * .05,
    //             right: width * .05,
    //             child: Align(
    //                 alignment: Alignment.center,
    //                 child:
    //             ),
    //           ),
    //           Positioned(
    //             top: height * .4,
    //             left: 10,
    //             right: 10,
    //             child: Column(
    //               children: [
    //               ],
    //             ),
    //           ),
    //           Positioned(
    //               bottom: height * 0.03,
    //               left: 20,
    //               right: 20,
    //               child:
    //           ),
    //         ],
    //       ),
    //     ));
  }
}
