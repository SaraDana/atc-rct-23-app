// import 'package:app/core/di/locator.dart';
// import 'package:app/features/edit_profile/app/cubits/edit_profile_cubit.dart';
// import 'package:app/generated/l10n.dart';
// import 'package:app/styles/dana_theme.dart';
// import 'package:flutter/material.dart';
//
// class PregnantWeeksDialog extends StatelessWidget {
//   const PregnantWeeksDialog({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(DanaTheme.bodyPadding),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: getWeekWidgets(
//             context,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// List<Widget> getWeekWidgets(BuildContext context) {
//   return Iterable<int>.generate(40)
//       .map((i) => [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: GestureDetector(
//                 onTap: () {
//                   locator<EditProfileCubit>().updatePregnantWeeks(i + 1);
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   '${S.of(context).pageProfileEditWeek} ${i + 1}',
//                   style: DanaTheme.textBody(DanaTheme.paletteDarkBlue),
//                 ),
//               ),
//             ),
//             Container(height: 1, color: DanaTheme.paletteLightGrey),
//           ])
//       .expand((x) => x)
//       .toList();
// }
