// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:intl/intl.dart';
// import 'package:mime/mime.dart';
// import 'package:sacredsaying/core/constants/place_holders.dart';
// import 'package:sacredsaying/core/styles/colors.dart';
// import 'package:sacredsaying/core/widgets/button_widget.dart';
// import 'package:sacredsaying/core/widgets/custom_raido_check.dart';
// import 'package:sacredsaying/core/widgets/custom_text_widget.dart';
// import 'package:sacredsaying/features/author_screen/domain/entities/authors_model.dart';
// import 'package:sacredsaying/features/author_screen/presentation/get/author_controller.dart';
// import 'package:sacredsaying/features/categories_tab_screen/domain/entities/category_model.dart';
// import 'package:sacredsaying/features/categories_tab_screen/presentation/get/category_controller.dart';
// import 'package:sacredsaying/features/main_screen/presentation/get/main_controller.dart';
// import 'package:sacredsaying/features/my_list_screen/domain/entities/bookmark_model.dart';
// import 'package:sacredsaying/features/my_list_screen/presentation/get/bookmark_controller.dart';
// import 'package:sacredsaying/features/my_list_screen/widgets/bottom_sheet_widget.dart';
// import 'package:sacredsaying/features/quotes_listing_screen/domain/entities/quotes_model.dart';
// import 'package:sacredsaying/features/quotes_listing_screen/presentation/get/quotes_controller.dart';
// import 'package:sacredsaying/features/quotes_search_screen/presentaion/widgets/filter_widget.dart';
// import 'package:sacredsaying/features/topics_screen/domain/entities/topics_model.dart';
// import 'package:share_plus/share_plus.dart';
//
// import '../../features/authentication/builder_ids.dart';
// import '../../features/authentication/presentation/get/auth_controller.dart';
// import '../../features/subscription_screens/presentation/get/stripe_pay_controller.dart';
// import '../../features/topics_screen/presentation/get/topics_controller.dart';
// import '../constants/app_assets.dart';
// import '../error/errors.dart';
// import '../services/network_service.dart';
//
// DateTime get lastBirthDate =>
//     DateTime.now().subtract(const Duration(days: 5475));
//
// String maskedCardNumber(String last4) => last4.padLeft(12, '*');
//
// String formatCardNumber(String cardNumber) {
//   final formatted = cardNumber.replaceAllMapped(
//     RegExp(r'^(\d{4})(\d{4})(\d{4})(\d{4})$'),
//     (match) => '${match[1]} ${match[2]} ${match[3]} ${match[4]}',
//   );
//   return formatted;
// }
//
// final formatCurrency =
//     NumberFormat.currency(name: "SGD ", locale: 'en_US', decimalDigits: 2);
//
// String priceDisplay(total) {
//   return formatCurrency.format(total);
// }
//
//
//
//
//
//
// final emailRegExp = RegExp(
//     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
// final trailingZeroRegExp = RegExp(r'([.]*0)(?!.*\d)');
// final spaceRegExp = RegExp('[ ]');
// final oneDecimal = RegExp(r'^\d+\.?\d*');
// final onlyAlphabets = RegExp("[a-z A-Z]");
// final manySpacesAsOne = RegExp(r"\s+");
// final denySpaceFormatter = FilteringTextInputFormatter.deny(spaceRegExp);
// final allowOnlyAlphaNumeric = RegExp("[0-9a-zA-Z]");
// final phoneRegExp = RegExp(r'^\+?\d*');
//
// /// Amount Calculator for Stripe
// stripeAmountCalculator(String amount) {
//   final calculatedAmount = (int.parse(amount)) * 100;
//   return calculatedAmount.toString();
// }
//
// String getExtension(Uint8List bytes) {
//   final mimeType = lookupMimeType('', headerBytes: bytes);
//   return mimeType!.split('/').last;
// }
//
// DateFormat timeDateDayYear = DateFormat.jm().add_MMMEd().add_y();
// DateFormat timeDateYear = DateFormat.jm().add_yMMMd();
// DateFormat goodDateFormat = DateFormat.MMMMEEEEd();
//
// DateFormat datePickerFormat = DateFormat('yyyy-MM-dd');
//
// ///If you want to keep the time format in 24-hour format,
// ///you can modify your expiryDateFormat object to use the
// ///H format specifier instead of the h specifier.
// ///The H specifier is used to represent the hour in a 24-hour format (0-23),
// ///whereas the h specifier is used to represent the hour in a 12-hour format (1-12).
//
// DateFormat apiDateFormat = DateFormat('yyyy-MM-dd');
//
// DateFormat dmyFormat = DateFormat('dd-MM-yyyy');
// DateFormat expiryDateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
// DateFormat couponDateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
// DateFormat cardExpiryFormat = DateFormat('MM/yyyy');
//
// // TODO: Replace all other API Date Formats with these
// DateFormat finalApiDateFormat = DateFormat('dd-MM-yyyy');
// DateFormat finalApiDateTimeFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
//
// const int maxScrollExtent = 50;
//
// void printWrapped(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   if (kDebugMode) {
//     pattern.allMatches(text).forEach((match) => log(match.group(0)!));
//   }
// }
//
// /// Logs the error return from the repo implementation
// logError(String title, CustomError error) {
//   log("<------------------------------ Inside [$title] ------------------------------>");
//
//   log(error.title, error: error);
//   log(error.message ?? '', error: error);
//
//   log(error.stackTrace);
// }
//
// checkNetwork(NetworkInfo networkInfo) async {
//   networkInfo.isConnected.then((value) {
//     return Future.error(NetworkError());
//   });
// }
//
// Future<void> showSnackDialog(context) async {
//   return showDialog(
//       context: context,
//       builder: (context) => const SnackBar(content: Text('data')));
// }
//
// apiExceptionMapping(int statusCode) {
//   // if (statusCode == 500) {
//   //   return Future.error(ServerError());
//   // }
//   // if (statusCode == 404) {
//   //   return Future.error(NotFoundException());
//   // }
//   // if (statusCode == 401) {
//   //   return Future.error(AuthenticationError());
//   // }
//   if (statusCode != 200) {
//     return Future.error(GeneralError());
//   }
// }
//
// String multiplierString(int firstValue, double secondValue) =>
//     '$firstValue X $secondValue';
//
// String skuString(int? id) => 'SKU: ${id ?? 'Needs Update'}';
//
// String totalString(String? currency) {
//   return 'Total(${currency ?? 'SGD '})';
// }
//
// String totalTax(String? currency) {
//   return 'Tax(${currency ?? 'SGD '})';
// }
//
// String totalPrice(String? symbol, double? price) {
//   return '${symbol ?? 'S\$'} ${price ?? 0.0}';
// }
//
// String formatPOName(int value) => 'P${value.toString().padLeft(5, '0')}';
//
// String formatITName(int value) => 'WH/INT/${value.toString().padLeft(5, '0')}';
//
// const int delayForListChange = 300;
//
// const TextInputType quantityKeyBoardType =
//     TextInputType.numberWithOptions(signed: true);
//
// String getFileWithError(String stackTrace) {
//   try {
//     String line = stackTrace.trim().split("\n")[0];
//     return line.split(':')[1].split('/').last;
//   } catch (e) {
//     return "Not located";
//   }
// }
//
// logAPI(String url) {
//   if (kDebugMode) {
//     log('API');
//     log(url);
//   }
// }
//
// logResponse(dynamic response) {
//   if (kDebugMode) {
//     log('Response');
//     log(response.toString());
//   }
// }
//
// logBody(dynamic body) {
//   if (kDebugMode) {
//     log('Body');
//     log(body.toString());
//   }
// }
//
// customLog({required String url, dynamic response, dynamic body}) {
//   logAPI(url);
//   if (body != null) {
//     logBody(body);
//   }
//
//   logResponse(response);
// }
//
// bool shouldShowBackButton(BuildContext context) {
//   final route = ModalRoute.of(context);
//   if (route != null) {
//     if (route is PageRoute && route.fullscreenDialog) {
//       // Exclude fullscreen dialogs from showing the back button
//       return false;
//     }
//     if (route.isFirst) {
//       // Exclude the last screen in the bottom navigation stack
//       return false;
//     }
//   }
//   return true;
// }
//
// showAlertDialog(BuildContext context, String message, String description,
//     Function() callBack) {
//   AlertDialog alert = AlertDialog(
//     title: Text(message),
//     content: Text(description),
//     actions: [
//       TextButton(
//         child: const Text("Cancel"),
//         onPressed: () {
//           Get.back();
//         },
//       ),
//       TextButton(child: const Text("Yes"), onPressed: callBack),
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
//
// getSearchParamsList(String searchText) {
//   List<String> searchOptions = [];
//   String temp = "";
//   for (int i = 0; i < searchText.length; i++) {
//     temp = temp + searchText[i];
//     searchOptions.add(temp);
//   }
//   return searchOptions;
// }
//
// showBookMarkSheetDialog(FilterType filterType, BuildContext context,
//     MainController mainController, dynamic dataModel, Function() onActionDone) {
//   BookMarkModel? selectBookMarkList;
//   showModalBottomSheet(
//     isScrollControlled: true,
//     backgroundColor: AppColors.containerAccentColor,
//     context: context,
//     showDragHandle: true,
//     builder: (context) {
//       final QuotesController quotesController = Get.find();
//       final CategoryController categoryController = Get.find();
//       final TopicsController topicsController = Get.find();
//       final AuthorController authorController = Get.find();
//
//       return GetBuilder<BookMarkController>(
//           id: updateBookMarkListIdScreen,
//           builder: (bookmarkController) {
//             selectBookMarkList = bookmarkController.bookMarkList.isEmpty
//                 ? null
//                 : bookmarkController.bookMarkList[0];
//             bookmarkController.initialValue.value = selectBookMarkList != null
//                 ? selectBookMarkList!
//                 : BookMarkModel(title: '', userID: '');
//             return bookmarkController.bookMarkList.isEmpty
//                 ? Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Icon(
//                                 Icons.close,
//                                 size: 30.0,
//                                 color: Colors.black.withOpacity(.5),
//                               ),
//                             ),
//                             const CustomTextWidget(
//                               text: "My Lists",
//                               colorText: AppColors.blackColor,
//                               fontWeight: FontWeight.w600,
//                               size: 18,
//                             ),
//                             GestureDetector(
//                                 onTap: () {},
//                                 child: const Text(
//                                   'data',
//                                   style: TextStyle(
//                                     color: AppColors.containerAccentColor,
//                                   ),
//                                 )),
//                           ],
//                         ),
//
//                         // CustomTextField(text:"No Bookmark Found"),
//                         Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: widgetCreateBookMarkButton(bookmarkController),
//                         ),
//                       ],
//                     ),
//                   )
//                 : SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Icon(
//                                         Icons.close,
//                                         size: 30.0,
//                                         color: Colors.black.withOpacity(.5),
//                                       ),
//                                     ),
//                                     const CustomTextWidget(
//                                       text: "My Lists",
//                                       colorText: AppColors.blackColor,
//                                       fontWeight: FontWeight.w600,
//                                       size: 18,
//                                     ),
//                                     GestureDetector(
//                                         onTap: () {},
//                                         child: const Text(
//                                           'data',
//                                           style: TextStyle(
//                                             color:
//                                                 AppColors.containerAccentColor,
//                                           ),
//                                         )),
//                                   ],
//                                 ),
//
//                                 // CustomTextField(text:"No Bookmark Found"),
//                               ],
//                             ),
//                           ),
//                           SingleChildScrollView(
//                             physics: ScrollPhysics(),
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: const ScrollPhysics(),
//                               itemBuilder: (BuildContext context, int index) {
//                                 var item =
//                                     bookmarkController.bookMarkList[index];
//                                 return Obx(() => LabeledRadio(
//                                       label: item.title,
//                                       groupValue:
//                                           bookmarkController.initialValue.value,
//                                       onChanged: (value) {
//                                         bookmarkController.initialValue.value =
//                                             value;
//                                         selectBookMarkList = value;
//                                       },
//                                       value: item,
//                                       padding: const EdgeInsets.all(2),
//                                     ));
//                               },
//                               itemCount: bookmarkController.bookMarkList.length,
//                             ),
//                           ),
//                           sizeFieldMediumPlaceHolder,
//                           ButtonWidget(
//                               text: "Add to list",
//                               buttonType: ButtonType.fill,
//                               color: AppColors.primaryColor,
//                               width: Get.size.width,
//                               expand: true,
//                               isLoading: bookmarkController.isListLoading,
//                               textStyle: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: 0.5),
//                               onPressed: () {
//                                 String usedID =
//                                     mainController.appUser?.id ?? "";
//
//                                 if (selectBookMarkList != null) {
//                                   if (FilterType.QUOTES == filterType) {
//                                     dataModel as QuotesModel;
//                                     quotesController.performBookMarkAction(
//                                         usedID, dataModel);
//                                     bookmarkController.insertBookMarkData(
//                                       filterType,
//                                       null,
//                                       null,
//                                       null,
//                                       dataModel.quoteID,
//                                       selectBookMarkList!.bookMarkReferenceID,
//                                     );
//                                   } else if (FilterType.AUTHOR == filterType) {
//                                     dataModel as AuthorModel;
//                                     authorController.performBookMarkAction(
//                                         usedID, dataModel);
//                                     bookmarkController.insertBookMarkData(
//                                       filterType,
//                                       null,
//                                       null,
//                                       dataModel.authorId,
//                                       null,
//                                       selectBookMarkList!.bookMarkReferenceID,
//                                     );
//                                   } else if (FilterType.TOPIC == filterType) {
//                                     print("topic select");
//                                     dataModel as TopicsModel;
//                                     topicsController.performBookMarkAction(
//                                         usedID, dataModel);
//                                     bookmarkController.insertBookMarkData(
//                                       filterType,
//                                       dataModel.topicID,
//                                       null,
//                                       null,
//                                       null,
//                                       selectBookMarkList!.bookMarkReferenceID,
//                                     );
//                                   } else {
//                                     dataModel as CategoryModel;
//                                     categoryController.performBookMarkAction(
//                                         usedID, dataModel);
//                                     bookmarkController.insertBookMarkData(
//                                       filterType,
//                                       null,
//                                       dataModel.categoryID,
//                                       null,
//                                       null,
//                                       selectBookMarkList!.bookMarkReferenceID,
//                                     );
//                                   }
//                                   onActionDone();
//                                 } else {
//                                   Fluttertoast.showToast(
//                                       msg: "Please select bookmark list");
//                                 }
//                               }),
//                           minPlaceHolder,
//                           widgetCreateBookMarkButton(bookmarkController),
//                         ],
//                       ),
//                     ),
//                   );
//           });
//     },
//   );
// }
//
// showFilterSheet(BuildContext context, QuotesController quotesController,
//     TabController tabController) {
//   showModalBottomSheet(
//     // isScrollControlled: true,
//     backgroundColor: AppColors.containerAccentColor,
//     context: context,
//     showDragHandle: true,
//     builder: (context) {
//       return GetBuilder<MainController>(
//           id: setFilterCheckBox,
//           builder: (mainController) {
//             return Column(
//               // mainAxisSize: MainAxisSize.min,
//               children: [
//                 CustomFilterWidget(
//                     filterType: quotesController
//                         .getFilterTypeByTabIndex(tabController.index)),
//               ],
//             );
//           });
//     },
//   );
// }
//
// widgetCreateBookMarkButton(BookMarkController bookmarkController) {
//   var context = Get.key.currentContext!;
//   return ButtonWidget(
//     text: "Create new list",
//     buttonType: ButtonType.fill,
//     color: const Color(0xffFDEFDB),
//     width: Get.size.width,
//     expand: true,
//     // isLoading: submitQuoteController.isSubmittingQuote,
//     textStyle: const TextStyle(
//         fontSize: 16,
//         color: Colors.black,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.5),
//     onPressed: () {
//       showAddNewListSheetDialog(
//         context,
//         bookmarkController,
//         bookmarkController.addBookMark(),
//         isShowFromQuoteList: true,
//
//       );
//     },
//   );
// }
//
// String getFormattedDateFromUnix(int unixTimestamp, String dateFormatString) {
//   DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
//   var dateFormat = DateFormat(dateFormatString);
//   return dateFormat.format(date);
// }
//
// getDateFormat(DateTime dateTime) {
//   String formattedDate = DateFormat("MMM d, y").format(dateTime);
//   return formattedDate;
// }
//
// double convertToDollars(int valueInRs, {double exchangeRate = 100}) {
//   double convertedAmount = valueInRs / exchangeRate;
//   return double.parse(convertedAmount.toStringAsFixed(2));
// }
//
// Future shareFile(String sharedMessage, String? subject) async {
//   await Share.share(sharedMessage, subject: subject);
// }
//
// // Future<void> downloadImage(String imagePath) async {
// //   try {
// //     print('Image URL: $imagePath'); // Print the imagePath for debugging purposes.
// //
// //     final tempDir = await getTemporaryDirectory();
// //     final path = '${tempDir.path}/sacredsayings.png';
// //
// //     // Make sure the imagePath has the correct URL prefix.
// //     if (!imagePath.startsWith('http://') && !imagePath.startsWith('https://')) {
// //       imagePath = 'http://$imagePath';
// //     }
// //
// //     // Use Dio to download the image.
// //     await Dio().download(imagePath, path);
// //
// //     // Save the image to the gallery.
// //     await GallerySaver.saveImage(path);
// //   } catch (error, stackTrace) {
// //     print('Error: $error');
// //     print('Stack Trace: $stackTrace');
// //   }
// // }
//
// Widget handleFavouriteActionButton(BuildContext context, dynamic dataModel,
//     FilterType filterType, Function()? updateUI,
//     {bool? isDiscoverQuote = false}) {
//   final AuthController authController = Get.find();
//   final MainController mainController = Get.find();
//   final QuotesController quotesController = Get.find();
//   final CategoryController categoryController = Get.find();
//   final TopicsController topicsController = Get.find();
//   final AuthorController authorController = Get.find();
//   final BookMarkController bookMarkController = Get.find();
//
//   var isBookedByUser = filterType == FilterType.QUOTES
//       ? quotesController.isBookMarkByUser(
//           mainController.appUser?.id ?? "", dataModel as QuotesModel)
//       : filterType == FilterType.CATEGORY
//           ? categoryController.isBookMarkByUser(
//               mainController.appUser?.id ?? "", dataModel as CategoryModel)
//           : filterType == FilterType.TOPIC
//               ? topicsController.isBookMarkByUser(
//                   mainController.appUser?.id ?? "", dataModel as TopicsModel)
//               : authorController.isBookMarkByUser(
//                   mainController.appUser?.id ?? "", dataModel as AuthorModel);
//
//   return clickableFavIcons(isDiscoverQuote!, () {
//     authController.isLoggedInAsGuest != true
//         ? mainController.appUser?.subscriptionStatus ==
//                 StripePaymentStatus.ACTIVE.name
//             ? !isBookedByUser
//                 ? showBookMarkSheetDialog(
//                     filterType, context, mainController, dataModel, () {
//                     if (updateUI != null) {
//                       updateUI();
//                     }
//                   })
//                 : showDeleteDialog("Alert",
//                     "Are you sure to delete this bookmark", "Yes", "No", () {
//                     Get.back();
//                     bookMarkController.deleteBookMarksByDataModel(
//                         filterType, dataModel);
//                     if (updateUI != null) {
//                       updateUI();
//                     }
//                   })
//             //showMultiOptionBookMarkDialog
//             : Fluttertoast.showToast(
//                 msg: " Bookmark feature is exclusive to premium subscribers.")
//         : loginAsGuestDialog(
//             'Login',
//             'Please login to continue',
//             Icons.done,
//             'Login',
//             Icons.close,
//             'Cancel',
//             () {
//               Get.back();
//               Get.find<AuthController>().logoutAsGuest();
//             },
//           );
//   }, isBookedByUser, filterType == FilterType.QUOTES ? 18 : 35, filterType);
// }
//
// Widget clickableFavIcons(bool isDiscoverQuote, Function()? onTap,
//     bool isSelected, double size, FilterType filterType) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: SvgPicture.asset(
//         color: isDiscoverQuote ? Color(0xFFFAF3DE) : null,
//         isSelected
//             ? filterType != FilterType.QUOTES
//                 ? AppAssets.icon_save_outlined1
//                 : AppAssets.icon_save_outlined1
//             : filterType != FilterType.QUOTES
//                 ? AppAssets.icon_save_outlined
//                 : AppAssets.icon_save,
//         width: isDiscoverQuote ? 25 : size,
//         height: isDiscoverQuote ? 25 : size,
//       ),
//     ),
//   );
// }
