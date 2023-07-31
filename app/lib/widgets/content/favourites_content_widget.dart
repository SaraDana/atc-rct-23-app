//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT LOCAL APP
import 'package:app/models/unit_bookmarked.dart';
import 'package:app/widgets/unit/unit_bookmarked_widget.dart';

class FavourtiesContentWidget extends StatelessWidget {
  final List<UnitWithImage?> unitWithImages;

  const FavourtiesContentWidget({Key? key, required this.unitWithImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardWith = MediaQuery.of(context).size.width * 0.445;

    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 10,
          children: unitWithImages.map(
            (unitWithImage) {
              return Container(
                width: cardWith,
                child: UnitBookmarkedWidget(
                  unitWithImage: unitWithImage,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
