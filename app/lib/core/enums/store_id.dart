enum StoreID {
  apple,
}

// extension for StoreID
extension StoreIDExtension on StoreID {
  String get number {
    switch (this) {
      case StoreID.apple:
        return '1559706974';
      default:
        return 'Unknown';
    }
  }
}