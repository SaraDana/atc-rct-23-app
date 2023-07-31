import 'package:app/core/ui/styles/app_spaces.dart';
import 'package:app/styles/dana_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowModal {
  static void showBottomSheet({
    required BuildContext context,
    required Widget widget,
    bool isDismissible = true,
  }) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) => widget,
    );
  }

  static void showCustomDialog({
    required BuildContext context,
    required Widget body,
    bool isDismissible = true,
  }) {
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              backgroundColor: DanaTheme.paletteWhite,
              child: body,
            ));
  }
}

class ModalUtils {
  void showModal(
    BuildContext context, {
    Function()? onPostTap,
    Function()? onEditTap,
    required String title,
    String? description,
    bool secondButton = true,
    String? confirmText,
    String? cancelText,
  }) {
    showModalBottomSheet(
      backgroundColor: DanaTheme.bgCardColor,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Wrap(
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gapH24,
                  _buildTitle(title),
                  if (description != null)
                    Column(
                      children: [
                        SizedBox(height: 10),
                        _buildDescription(description)
                      ],
                    )
                ],
              ),
              if (confirmText != null && onPostTap != null) ...[
                _postButton(onPostTap, confirmText),
               15.h.verticalSpace,
              ],
              if (cancelText != null)
                if (secondButton == true) _editButton(onEditTap, cancelText),
              if (cancelText == null || confirmText == null) 100.h.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: DanaTheme.bannerTitle1,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: DanaTheme.bannerTitle2,
      textAlign: TextAlign.center,
    );
  }

  Widget _postButton(Function() postTap, String confirmText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120),
        child: GestureDetector(
          onTap: postTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: DanaTheme.bodyPadding),
            decoration: BoxDecoration(
              color: DanaTheme.paletteOrange,
              borderRadius: BorderRadius.circular(162),
            ),
            width: double.infinity,
            child: Center(
                child: Text(
              confirmText,
              style: DanaTheme.bannerTitle2.copyWith(
                color: DanaTheme.tertiaryColor,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ),
    );
  }

  Widget _editButton(Function()? editTap, String cancelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: GestureDetector(
        onTap: editTap,
        child: Container(
          decoration: BoxDecoration(
            color: DanaTheme.tertiaryColor,
          ),
          width: double.infinity,
          child: Center(
            child: Text(
              cancelText,
              style: DanaTheme.bannerTitle2.copyWith(
                color: DanaTheme.paletteOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
