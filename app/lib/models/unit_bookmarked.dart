import 'unit_model.dart';

class UnitWithImage {
  String? image;
  late Unit unit;

  UnitWithImage({
    required String? image,
    required Unit unit,
  }) {
    this.image = image;
    this.unit = unit;
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'unit': unit.toJson(),
      };
}

class UnitBookmarked {
  String? userId;
  List<UnitWithImage?>? units;

  UnitBookmarked({
    required String userId,
    required List<UnitWithImage?> units,
  }) {
    this.userId = userId;
    this.units = units;
  }

  UnitBookmarked.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    units = json['units'] == null ? null : _fromJson(json['units']);
  }

  List<UnitWithImage?> _fromJson(List<dynamic> jsonList) {
    final List<UnitWithImage?> itemList = [];

    jsonList.forEach((json) {
      final Unit unit = Unit.fromJson(json['unit']);
      itemList.add(UnitWithImage(image: json['image'], unit: unit));
    });

    return itemList;
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'units': units == null
            ? null
            : List<UnitWithImage>.from(units!.map((x) => x)),
      };
}
