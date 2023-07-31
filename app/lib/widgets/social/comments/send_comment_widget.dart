import 'package:app/generated/l10n.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class SendCommentWidget extends StatelessWidget {
  final TextEditingController? commentController;
  final Function() onTap;
  const SendCommentWidget(
      {Key? key, required this.commentController, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: DanaTheme.palleteGrayBorder, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 108.0,
        ),
        child: TextFormField(
          controller: commentController,
          maxLines: null,
          style: TextStyle(fontSize: 12, color: DanaTheme.paletteDarkBlue),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
            filled: true,
            fillColor: DanaTheme.palleteGrayBorder,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: S.of(context).pagePublicationDetailsWriteYourComment,
            hintStyle: DanaTheme.textCommentDate(DanaTheme.palleteDarkGray),
            suffix: GestureDetector(
              onTap: onTap,
              child: Text(
                S.of(context).pagePublicationDetailsPublish,
                style: TextStyle(color: DanaTheme.palleteRed),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: DanaTheme.paletteGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: DanaTheme.paletteGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: DanaTheme.paletteGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
