import 'package:flutter/cupertino.dart';

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.content, this.bulletStyle);
  final Widget content;
  final TextStyle bulletStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• ", style: bulletStyle),
        Expanded(
          child: content,
        ),
      ],
    );
  }
}
