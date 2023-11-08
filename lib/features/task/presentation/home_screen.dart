import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_task/features/task/widgets/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<CameraItem> cameraItems = [
    CameraItem(
      image: 'assets/images/1.png',
      title: 'Camera 1',
      price: '\$699',
      description: 'Compact and versatile camera for every situation.',
    ),
    CameraItem(
      image: 'assets/images/2.png',
      title: 'Camera 2',
      price: '\$699',
      description: 'Compact and versatile camera for every situation.',
    ),
    CameraItem(
      image: 'assets/images/3.png',
      title: 'Camera 3',
      price: '\$699',
      description: 'Compact and versatile camera for every situation.',
    ),
    CameraItem(
      image: 'assets/images/4.png',
      title: 'Camera 4',
      price: '\$699',
      description: 'Compact and versatile camera for every situation.',
    ),
    CameraItem(
      image: 'assets/images/5.png',
      title: 'Camera 5',
      price: '\$699',
      description: 'Compact and versatile camera for every situation.',
    ),
    CameraItem(
      image: 'assets/images/6.png',
      title: 'Camera 6',
      price: '\$699',
      description: 'Compact and versatile camera for every situation.',
    ),
    // Add more CameraItem instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(),
        title: CustomTextWidget(
          text: 'Salavati',
          size: 18,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView.builder(
        itemCount: cameraItems.length,
        itemBuilder: (context, index) {
          final cameraItem = cameraItems[index];
          return Slidable(

            closeOnScroll: true,
            useTextDirection: false,
            startActionPane: ActionPane(
              children: [
                SlidableAction(
                  backgroundColor: Colors.redAccent,
                  icon: Icons.bookmark,
                  onPressed: (context) {},
                )
              ],
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(onDismissed: () {}),
            ),
            // actionExtentRatio: 0.25,
            child: ListTile(
              minVerticalPadding: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  cameraItem.image,
                  fit: BoxFit.cover,
                ),
              ),
              title: CustomTextWidget(
                text: cameraItem.title,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              subtitle: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomTextWidget(
                        text: cameraItem.price,
                        size: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomTextWidget(
                        text: cameraItem.description,
                        size: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),

                ],
              ),
              onTap: () {
                // Handle item tap
              },
              contentPadding: EdgeInsets.all(16.0),
            ),
            // secondaryActions: <Widget>[
            //   IconSlideAction(
            //     caption: 'Edit',
            //     color: Colors.blue,
            //     icon: Icons.edit,
            //     onTap: () {
            //       // Handle edit action
            //     },
            //   ),
            //   IconSlideAction(
            //     caption: 'Delete',
            //     color: Colors.red,
            //     icon: Icons.delete,
            //     onTap: () {
            //       // Handle delete action
            //     },
            //   ),
            // ],
          );
        },
      ),
    );
  }
}

class CameraItem {
  final String image;
  final String title;
  final String price;
  final String description;

  CameraItem({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}
