import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';

class SuccessDialogWidget extends StatefulWidget {
  final String message;

  const SuccessDialogWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _SuccessDialogWidgetState createState() => _SuccessDialogWidgetState();
}

class _SuccessDialogWidgetState extends State<SuccessDialogWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: DanaTheme.bgSuccessColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: DanaTheme.whiteColor,
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(DanaTheme.bodyPadding),
            color: DanaTheme.bgSuccessColor,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Icon(
                    Icons.check,
                    size: 64.0,
                    color: Colors.white,
                  ),
                  Text(
                    widget.message,
                    style: DanaTheme.successText,
                    textAlign: TextAlign.center,
                  )
                ]))));
  }
}
