// import 'package:flutter/material.dart';
// import 'package:mychat/shared/app_theme.dart';
//
// class dftEvelatedBtn extends StatelessWidget {
// final  String txt;
//  final Function()onPress;
// final double borderRadiusValue;
// double? width;
//    dftEvelatedBtn({
//      required this.txt,
//      required this.onPress,
//      this.borderRadiusValue=6.0,
//      this.width,
//      super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//
//         style:ElevatedButton.styleFrom(
//           backgroundColor: AppTheme.primarycolor,
//           foregroundColor: AppTheme.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadiusValue)
//           ),
//           fixedSize: Size(width??MediaQuery.of(context).size.width, 52)
//         ) ,
//         onPressed:onPress, child:
//     Text(txt,style:
//     TextStyle(
//       color:  AppTheme.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 18.0
//     ),));
//   }
// }
import 'package:flutter/material.dart';
import 'package:mychat/shared/app_theme.dart';

class dftEvaltedBtn extends StatelessWidget {
  String txt;
  Function()onPress;
  double? width;
   dftEvaltedBtn({
     required this.txt,
     required this.onPress,
     this.width,
     super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primarycolor,
          foregroundColor: AppTheme.white,
          fixedSize: Size(width??MediaQuery.of(context).size.width, 40)
        ) ,
        onPressed:onPress,
        child: Text(txt,style: TextStyle(
          color: AppTheme.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),));
  }
}

