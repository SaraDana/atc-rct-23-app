// import 'package:app/core/di/locator.dart';
// import 'package:app/features/edit_profile/app/cubits/edit_profile_cubit.dart';
// import 'package:app/features/user/domain/enums/mother_months_enum.dart';
// import 'package:app/styles/dana_theme.dart';
// import 'package:flutter/material.dart';
//
// class MotherMonthsDialog extends StatelessWidget {
//   const MotherMonthsDialog({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final Map<MotherMonths, String> monthsLabels = getMonthsLabels(context);
//     return Container(
//       padding: EdgeInsets.all(DanaTheme.bodyPadding),
//       child: SingleChildScrollView(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: MotherMonths.values
//                 .map((month) => Padding(
//                       padding: EdgeInsets.all(10),
//                       child: GestureDetector(
//                         onTap: () {
//                           locator<EditProfileCubit>().updateMotherMonths(month);
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           monthsLabels[month]!,
//                           style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
//                         ),
//                       ),
//                     ))
//                 .toList()),
//       ),
//     );
//   }
// }
