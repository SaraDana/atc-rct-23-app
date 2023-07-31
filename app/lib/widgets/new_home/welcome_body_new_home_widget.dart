//IMPORT EXTERN APP
import 'package:flutter/material.dart';

//IMPORT INTERN APP
import 'package:app/styles/dana_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeBodyNewHomeWidget extends StatelessWidget {
  final String name;
  final String profileMoment;
  final Function() onPressed;
  const WelcomeBodyNewHomeWidget(
      {Key? key,
      required this.name,
      required this.profileMoment,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 130,
          width: 1.sw,
          child: Stack(
            children: [
              Container(
                width: 1.sw,
                height: 90,
                //color: DanaTheme.bgAppbar,
                color: DanaTheme.bgAppbar,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/bg_header.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20),
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style:
                      DanaTheme.textHeadlineSmall(DanaTheme.paletteDarkBlue)),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(right: 8),
                ),
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      profileMoment,
                      style: DanaTheme.textSmallText(
                        DanaTheme.paletteDarkBlue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.more_vert,
                        color: DanaTheme.paletteDarkBlue,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
