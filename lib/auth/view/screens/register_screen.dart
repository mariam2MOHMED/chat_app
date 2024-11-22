// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mychat/shared/app_theme.dart';
// import 'package:mychat/auth/view_model/auth_states.dart';
// import 'package:mychat/auth/view_model/auth_view_model.dart';
//
//
// import 'package:mychat/shared/firebase_utils.dart';
// import 'package:mychat/auth/view/widgets/dft_txt_field.dart';
//
//
// import 'package:mychat/shared/firebase_utils.dart';
// import 'package:mychat/home_screen.dart';
// import 'package:mychat/shared/ui_utils.dart';
//
// import '../../../shared/app_validator.dart';
// import '../widgets/df_evalted_btn.dart';
// import 'login_screen.dart';
// class RegisterScreen extends StatefulWidget {
//   static String routeName="/RegisterScreen";
//    RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   var namecontroll=TextEditingController();
//   var emailcontroll=TextEditingController();
//   var passwordcontroll=TextEditingController();
//   var formkey=GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppTheme.white,
//         image: DecorationImage(image: AssetImage
//           ('assets/images/background.png'),fit:BoxFit.fill )
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
//                 dftTextField(controller: namecontroll,
//                     hint: 'Name',
//                   validator: (value){
//                   if(value==null||value.trim().isEmpty){
//                     return "name must be not empty";
//                   }else{
//                     return  null;
//                   }
//                   },),
//                 SizedBox(height: 20.0,),
//                 dftTextField(controller: emailcontroll,
//                     hint: 'E-mail',
//                   validator: (value){
//                     if(value==null||value.trim().isEmpty){
//                       return "email must be not empty";
//                     }
//                     else if(!AppValidator.isEmail(value)){
//                       return "Invalid Email";
//                     }
//                     else{
//                       return  null;
//                     }
//                   },),
//                 SizedBox(height: 20.0,),
//                 dftTextField(
//                   isPassword: true,
//                     controller: passwordcontroll,
//                     hint: 'Password',
//                   validator: (value){
//                     if(value==null||value.trim().isEmpty){
//                       return "Password must be not empty";
//                     }else{
//                       return  null;
//                     }
//                   },
//                 ),
//                 SizedBox(height: 20.0,),
//                 BlocListener<AuthViewModel, AuthStates>(
//   listener: (context, state) {
//    if(state is RegisterLoading){
//      UiUtils.showDilog(context);
//    }
//    if(state is RegisterSucess){
//      UiUtils.hideDialog(context);
//      Navigator.of(context)
//          .pushNamed(HomeScreen.routeName);
//    }
//    if(state is RegisterError){
//      UiUtils.hideDialog(context);
//      Fluttertoast.showToast(msg: state.error);
//    }
//   },
//   child: dftEvelatedBtn(txt: "Create Account",
//                     onPress: register),
// ),
//                 SizedBox(height: 20.0,),
//                 InkWell(
//                   onTap: (){
//                     Navigator.of(context)
//                         .pushNamed(LoginScreen.routeName);
//                   },
//                   child: Align(
//                       alignment:AlignmentDirectional.bottomStart ,
//                       child: Text("Already have an account")),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   void register(){
// if(formkey.currentState!.validate()){
//  BlocProvider.of<AuthViewModel>(context).
//  register(name: namecontroll.text,
//      email: emailcontroll.text,
//      password: passwordcontroll.text);
// }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/auth/view/screens/login_screen.dart';
import 'package:mychat/auth/view/widgets/df_evalted_btn.dart';
import 'package:mychat/auth/view/widgets/dft_txt_field.dart';
import 'package:mychat/auth/view_model/auth_states.dart';
import 'package:mychat/home_screen.dart';
import 'package:mychat/shared/app_theme.dart';
import 'package:mychat/shared/ui_utils.dart';

import '../../view_model/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/RegisterScreen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var namecontroll = TextEditingController();
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
          title: Text("Register Screen"),
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
                        return "Name must be not empty";
                      } else if (value.length < 3) {
                        return "Name must be more than 3 characters";
                      } else {
                        return null;
                      }
                    }, controller: namecontroll,

                    hinttxt: "Name"),
                SizedBox(height: 16.0,),
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
                if(state is RegisterLoading){
                  UiUtils.showDilog(context);
                }   if(state is RegisterSucess){
                  UiUtils.hideDialog(context);
                  UiUtils.showMessage("User registered sucessfully",
                      AppTheme.primarycolor);
                  Navigator.of(context).pushNamed(HomeScreen.routeName);

                }if(state is RegisterError ){
                  UiUtils.hideDialog(context);
                  UiUtils.showMessage("Some thing went Wrong",
                      Colors.red);
                }
                  },
                  child: dftEvaltedBtn(txt: "Create Account", onPress: register),
                ),
                SizedBox(height: 16.0,),
                InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Text("Already Have an acount",style: Theme.of(context).textTheme.headlineMedium,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (fromkey.currentState!.validate()) {
      BlocProvider.of<AuthViewModel>(context).
      register(email: emailcontroll.text,
          password: passwordcontroll.text,
          name: namecontroll.text);
    }
  }
}
