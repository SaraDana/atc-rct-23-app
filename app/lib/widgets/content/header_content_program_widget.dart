//IMPORT EXTERN APP
//IMPORT INTERN APP
import 'package:app/models/program_model.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:app/utils/screen_size.dart';
import 'package:app/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderContentProgramWidget extends StatelessWidget {
  final Program program;
  final String? imageUrl;

  const HeaderContentProgramWidget({
    Key? key,
    required this.program,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 600, minWidth: double.infinity),
      color: DanaTheme.paletteDarkBlue,
      transform: Matrix4.translationValues(0.0, 1, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              imageUrl != null
                  ? Container(
                      color: DanaTheme.paletteDarkBlue,
                      child: SizedBox(
                        width: getScreenWidth(context),
                        child: Hero(
                          tag: program.id!,
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    )
                  : Container(height: 10),
              CustomAppBar(
                title: program.title!,
                styleTitle:
                    DanaTheme.textSuperSmallTextBold(DanaTheme.paletteDarkBlue),
                bgColor: Colors.transparent,
                onBackPressed: () {
                  context.canPop() ? context.pop() : null;
                },
                // actions: _buildActions(_collection),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: DanaTheme.bodyPadding,
              left: DanaTheme.bodyPadding,
              right: DanaTheme.bodyPadding,
              bottom: 4,
            ),
            child: Text(
              '${program.title}',
              textAlign: TextAlign.center,
              style: DanaTheme.textHeadline(DanaTheme.paletteWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DanaTheme.bodyPadding,
              right: DanaTheme.bodyPadding,
            ),
            child: Text(
              program.subtitle!,
              textAlign: TextAlign.center,
              style: DanaTheme.textSmallText(DanaTheme.paletteWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DanaTheme.bodyPadding,
              right: DanaTheme.bodyPadding,
              bottom: 20,
            ),
            child: Text(
              program.description!,
              textAlign: TextAlign.center,
              style: DanaTheme.textSmallText(DanaTheme.paletteWhite),
            ),
          ),
        ],
      ),
    );
  }
}
