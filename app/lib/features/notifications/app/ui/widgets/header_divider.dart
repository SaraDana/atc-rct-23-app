import 'package:app/features/notifications/domain/enums/separator_type.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class HeaderDivider extends StatelessWidget {
  final SeparatorType separatorType;
  const HeaderDivider({
    required this.separatorType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            title: Text(
              separatorType.nameUI,
              style: DanaTheme.textBodyBold(DanaTheme.paletteDarkBlue),
            )),
        Divider(thickness: 0.8,)
      ],
    );
  }
}