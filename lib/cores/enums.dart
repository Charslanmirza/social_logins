enum EntityType {
  choice(100.0,
      itemSeparation: 5.0,
      maxCrossAxisExtent: 160.0,
      width: 100.0,
      displayName: 'Choice'),
  voucher(150.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 200.0,
      width: 170.0,
      displayName: 'Voucher'),
  promotion(150.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 400.0,
      width: 280.0,
      displayName: 'Promotion'),
  voucherUse(150,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 500.0,
      width: 400.0,
      displayName: 'Voucher Use'),
  cartItem(70.0,
      itemSeparation: 5.0,
      maxCrossAxisExtent: 500.0,
      width: 100.0,
      displayName: 'Cart Item'),
  product(160.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 700.0,
      width: 250.0,
      displayName: 'Product'),
  cart(120.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 500.0,
      width: 350.0,
      displayName: 'Cart'),
  customerAddress(150.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 500.0,
      width: 250.0,
      displayName: 'Customer Address'),
  address(150.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 500.0,
      width: 300.0,
      displayName: 'Address'),
  brand(70.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 200.0,
      width: 70.0,
      displayName: 'Brand'),
  order(100.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 500.0,
      width: 300.0,
      displayName: 'Order'),
  orderLine(80.0,
      itemSeparation: 5.0,
      maxCrossAxisExtent: 500.0,
      width: 250.0,
      displayName: 'Order'),
  invoice(140.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 500.0,
      width: 250.0,
      displayName: 'Order'),
  latestQuotes(700.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 600.0,
      width: 250.0,
      displayName: 'Latest quotes'),
  imageQuotes(285.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 600.0,
      width: 250.0,
      displayName: 'Latest quotes'),
  purchasedContract(150.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 600.0,
      width: 250.0,
      displayName: 'Servicing Contract'),
  category(70.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 200.0,
      width: 70.0,
      displayName: 'Category'),
  card(50.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 400.0,
      width: 330.0,
      displayName: 'Card'),
  transaction(85.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 400.0,
      width: 330.0,
      displayName: 'Transaction'),
  appointment(370.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 400.0,
      width: 580.0,
      displayName: 'Data'),
  points(130.0,
      itemSeparation: 10.0,
      maxCrossAxisExtent: 400.0,
      width: 280.0,
      displayName: 'Appointment');

  const EntityType(this.height,
      {required this.itemSeparation,
      required this.maxCrossAxisExtent,
      required this.width,
      required this.displayName});

  final double height;
  final double width;

  final double itemSeparation;
  final double maxCrossAxisExtent;

  final String displayName;
}

enum OperationType { add, edit }

enum LoadingState { loading, loaded, error }

enum ImageType { user, product }

extension ImageTypeExtension on ImageType {
  String get model {
    switch (this) {
      case ImageType.user:
        return 'res.partner';
      case ImageType.product:
        return 'product.product';
    }
  }
}

enum PopupType { menu, dialog, modalBottomSheet }

enum AddressType {
  delivery("Shipping Address"),
  billing("Billing Address");

  const AddressType(this.title);

  final String title;
}

enum Gender {
  male("Male"),
  female("Female"),
  other("Other");

  const Gender(this.displayName);

  final String displayName;

  @override
  String toString() => displayName;
}
