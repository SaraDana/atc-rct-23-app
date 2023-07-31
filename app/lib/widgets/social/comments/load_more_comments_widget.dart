import 'package:flutter/material.dart';

class LoadMoreCommentsWidget extends StatelessWidget {
  final int commentsNumber;
  final int stateCommentsNumber;
  final Function() onPressed;
  final String loadText;
  final Color colorText;
  final double sizeText;
  final bool isSubcomment;
  const LoadMoreCommentsWidget({
    Key? key,
    required this.commentsNumber,
    required this.stateCommentsNumber,
    required this.onPressed,
    required this.loadText,
    required this.colorText,
    required this.sizeText,
    required this.isSubcomment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (commentsNumber > stateCommentsNumber)
        ? Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 30),
            child: Container(
              child: Center(
                child: TextButton(
                  onPressed: onPressed,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: (isSubcomment == false)
                        ? Text(
                            loadText,
                            style: TextStyle(
                              color: colorText,
                              fontSize: sizeText,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 34,
                                height: 2,
                                color: colorText,
                              ),
                              Text(
                                loadText,
                                style: TextStyle(
                                  color: colorText,
                                  fontSize: sizeText,
                                ),
                              ),
                              Container(
                                width: 34,
                                height: 2,
                                color: colorText,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
