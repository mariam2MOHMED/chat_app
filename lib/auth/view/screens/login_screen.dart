// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mychat/shared/app_theme.dart';
// import 'package:mychat/shared/app_validator.dart';
// import 'package:mychat/auth/view/widgets/dft_txt_field.dart';
// import 'package:mychat/auth/view_model/auth_states.dart';
// import 'package:mychat/auth/view_model/auth_view_model.dart';
//
//
// import 'package:mychat/shared/firebase_utils.dart';
// import 'package:mychat/shared/ui_utils.dart';
//
// import '../../../home_screen.dart';
// import '../widgets/df_evalted_btn.dart';
//
// class LoginScreen extends StatefulWidget {
//   static String routeName="/LoginScreen";
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   var emailcontroll=TextEditingController();
//   var passwordcontroll=TextEditingController();
//   var formkey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: AppTheme.white,
//           image: DecorationImage(image: AssetImage
//             ('assets/images/background.png'),fit:BoxFit.fill )
//       ),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: formkey,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 dftTextField(controller: emailcontroll,
//                     hint: 'E-mail',
//                 validator: (value){
//                     if(value==null||value.trim().isEmpty
//                         ){
//                     return "email must be not empty";
//                     }
//                     else if(!AppValidator.isEmail(value)){
//                       return "Invalid Email";
//                     }
//                     else{
//                     return  null;
//                     }
//                     },
//                 ),
//                 SizedBox(height: 20.0,),
//                 dftTextField(
//                     validator: (value){
//                       if(value==null||value.trim().isEmpty){
//                         return "Password must be not empty";
//                       }else{
//                         return  null;
//                       }
//                     },
//                     isPassword: true,
//                     controller: passwordcontroll,
//                     hint: 'Password'),
//                 SizedBox(height: 20.0,),
//                 BlocListener<AuthViewModel, AuthStates>(
//   listener: (context, state) {
//   if(state is LoginLoading){
// UiUtils.showDilog(context);
//   } if(state is LoginSucess){
//     UiUtils.hideDialog(context);
//     Fluttertoast.showToast(msg:
//     "user logined sucessfully",
//     timeInSecForIosWeb: 10,
//     toastLength: Toast.LENGTH_LONG,
//     textColor: AppTheme.white,
//     backgroundColor: AppTheme.primarycolor);
//
//     Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
//   }
//   if(state is LoginError){
//     UiUtils.hideDialog(context);
//    Fluttertoast.showToast(msg: state.error);
//   }
//   },
//   child: dftEvelatedBtn(txt: "login",
//                     onPress: login),
// ),
//                 SizedBox(height: 20.0,),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void login(){
//
//     if(formkey.currentState!.validate()){
//     BlocProvider.of<AuthViewModel>(context).
//     login(email: emailcontroll.text,
//         password: passwordcontroll.text);
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/auth/view/widgets/df_evalted_btn.dart';
import 'package:mychat/auth/view/widgets/dft_txt_field.dart';
import 'package:mychat/auth/view_model/auth_states.dart';
import 'package:mychat/auth/view_model/auth_view_model.dart';
import 'package:mychat/home_screen.dart';
import 'package:mychat/shared/app_theme.dart';
import 'package:mychat/shared/ui_utils.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="/LoginScreen";
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailcontroll = TextEditingController();
  var passwordcontroll = TextEditingController();
  var fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
          image: DecorationImage(image:
          AssetImage('assets/images/background.png'),fit: BoxFit.fill)
        ),
        child: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                dftTxtField(
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "E-mail must be not empty";
                      } else if (value.length < 3) {
                        return "E-mail must be more than 3 characters";
                      } else {
                        return null;
                      }
                    }, controller: emailcontroll,

                    hinttxt: "E-mail"),
                SizedBox(height: 16.0,),
                dftTxtField(
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "Password must be not empty";
                      } else if (value.length < 3) {
                        return "Password must be more than 3 characters";
                      } else {
                        return null;
                      }
                    }, controller: passwordcontroll,

                    hinttxt: "Password"),
                SizedBox(height: 16.0,),
                BlocListener<AuthViewModel, AuthStates>(
                  listener: (context, state) {
                    if(state is LoginLoading){
                      UiUtils.showDilog(context);
                    }   if(state is LoginSucess){
                      UiUtils.hideDialog(context);
                      UiUtils.showMessage("User logined sucessfully",
                          AppTheme.primarycolor);
                      Navigator.of(context).pushNamed(
                          HomeScreen.routeName);
                    } if (state is LoginError){ {
                      UiUtils.hideDialog(context);
                      UiUtils.showMessage("Some thing went Wrong",
                          Colors.red);
                    }
                  }
                    },
                  child:
                  dftEvaltedBtn(txt: "Login", onPress: login),
                )
              ],
            ),
          ),
        ),
            ),
      );
  }
  void login() {
    if (fromkey.currentState!.validate()) {
      BlocProvider.of<AuthViewModel>(context).
      login(email: emailcontroll.text,
          password: passwordcontroll.text,
          );
    }
  }
}
