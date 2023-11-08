class AppLiterals {
  // Literals for Page Title
  static const String appTitle = 'DIS AIR CON';
  static const String loginViaEmail = 'LOGIN VIA EMAIL';
  static const String loginViaPhone = 'LOGIN VIA PHONE';
  static const String signUpHere = 'Sign up here';
  static const String loginAsGuest = 'Login as a Guest';
  static const String login = 'Login';

  static const String resetFiltersButtonText = 'Reset';
  static const String applyFiltersButtonText = 'Apply';
  // Empty String
  static const String emptyString = '';

  static RegExp get emailRegExp => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp get priceRegExp => RegExp(r'^\d+\.?\d*');

  // Info/Error Messages
  static const String successTitle = 'Success';
  static const String stockValidatedText = 'Stock Transfer Validated';
  static const String productNotFoundTitle = 'Product Not Found';
  static const String productNotFoundMessage =
      'This Product is Not Available in the Warehouse.';

  // App literals for [CustomError]
  static const String defaultClientErrorTitle = 'Client Authentication Error';
  static const String defaultClientErrorMessage =
      'Some error occurred in client Authentication, try later.';

  static const String defaultAuthenticationErrorTitle = 'Authentication Error';
  static const String defaultAuthenticationErrorMessage =
      'Your email and password did not match.';

  static const String defaultNotFoundErrorTitle = 'Not Found';
  static const String defaultNotFoundErrorMessage =
      'The requested item was not found.';

  static const String defaultNetworkErrorTitle = 'Network Error';
  static const String defaultNetworkErrorMessage =
      'Unable to connect to internet.';

  static const String defaultGeneralErrorTitle = 'Problem Occurred';
  static const String defaultGeneralErrorMessage =
      'Unable to process your request, try again, or contact customer support.';

  //literals for text widget
  static const String demandText = 'Demand';
  static const String receivedText = 'Received';
  static const String demandQtyText = 'Demand Quantity';
  static const String doneText = 'Done';
  static const String doneQtyText = 'Done Quantity';
  static const String reservedText = 'Reserved';
  static const String dispatcherText = 'Dispatcher';
  static const String destinationText = 'Destination';
  static const String addressText = 'Address';
  static const String titleText = 'Title';
  static const String messageText = 'Message';
  static const String yesText = 'Yes';
  static const String noText = 'No';
  static const String backOrderButtonText = 'Create Back Order';
  static const String noBackOrderButtonText = 'No Back Order';
  static const String okButtonText = 'OK';
  static const String applyButtonText = 'Apply';
  static const String cancelButtonText = 'Cancel';
  static const String termsAndConditions =
      'This section outlines that by using the app, the user agrees to the terms and conditions. This section describes the rules around creating an account, including age restrictions and the requirement for accurate personal information.This section explains the rules around product listings, including prohibited items and requirements for accurate product descriptions.This section outlines the rules around payment processing, including fees, refund policies, and chargeback policies.This section explains the rules around shipping and delivery, including delivery timelines and shipping costs. This section outlines the rules around intellectual property, including copyright infringement and trademarks.';
}
