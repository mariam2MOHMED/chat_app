// import 'package:flutter/material.dart';
//
// class dftTextField extends StatefulWidget {
//   TextEditingController controller;
//   String hint;
//   bool isPassword;
//   String? Function(String?)? validator;
//    dftTextField({
//      required this.controller,
//      required this.hint,
//      this.isPassword=false,
//      this.validator,
//      super.key});
//
//   @override
//   State<dftTextField> createState() => _dftTextFieldState();
// }
//
// class _dftTextFieldState extends State<dftTextField> {
//   bool obsecure=false;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
// obscureText: obsecure,
//       validator:widget.validator,
//       controller: widget.controller,
//
//      decoration: InputDecoration(
//        border: UnderlineInputBorder(
//        )
//         ,hintText: widget.hint,
//        suffixIcon: widget.isPassword==true?
//          IconButton(onPressed: (){
//            obsecure=!obsecure;
//            setState(() {
//
//            });
//          }, icon:
//          Icon(obsecure==true?Icons.visibility_off:Icons.visibility)):
//       null,
//        hintStyle: TextStyle(
//          fontSize: 16.0,
//          fontWeight:FontWeight.w400,
//          color: Colors.grey
//        )
//      ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mychat/shared/app_theme.dart';

class dftTxtField extends StatefulWidget {
  TextEditingController controller;
  String hinttxt;
  bool isPassword;
  int maxlines;
  String? Function(String?)? validator;
   dftTxtField({
     this.maxlines=1,
     required this.controller,
     required this.hinttxt,
      this.validator,
      this.isPassword=false,
     super.key});

  @override
  State<dftTxtField> createState() => _dftTxtFieldState();
}

class _dftTxtFieldState extends State<dftTxtField> {
  bool obsecure=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxlines,
    obscureText: obsecure,
   controller: widget.controller,
   validator: widget.validator,
   autovalidateMode: AutovalidateMode.onUserInteraction,
   decoration: InputDecoration(
     hintText: widget.hinttxt,

     hintStyle: TextStyle(
       color: AppTheme.grey,
       fontSize: 14.0,
       fontWeight: FontWeight.w400
     ),
     suffixIcon: widget.isPassword==true?
     IconButton(onPressed: (){
       obsecure=!obsecure;
       setState(() {

       });
     },
         icon:obsecure==true? Icon(Icons.visibility)
             :Icon(Icons.visibility_off)):null,
     border: UnderlineInputBorder(),

   ),
    );
  }
}

