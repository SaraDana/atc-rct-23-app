import 'package:app/models/purchases/purchase_info/purchase_info.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchasableProduct {
  String get id => purchaseInfo.id;
  String get title => purchaseInfo.title;
  String get description => purchaseInfo.description;
  String get price => purchaseInfo.price;
  PurchaseInfo purchaseInfo;

  PurchasableProduct(this.purchaseInfo);
  factory PurchasableProduct.fromPackage(Package package) {
    return PurchasableProduct(
      PurchaseInfo(
        id: package.storeProduct.identifier,
        title: package.storeProduct.title,
        description: package.storeProduct.description,
        price: package.storeProduct.priceString,
        rawPrice: package.storeProduct.price,
        currencyCode: package.storeProduct.currencyCode,
      ),
    );
  }
}
