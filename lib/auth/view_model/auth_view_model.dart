// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mychat/auth/models/user_model.dart';
// import 'package:mychat/auth/view_model/auth_states.dart';
// import 'package:mychat/shared/firebase_utils.dart';
// class AuthViewModel extends Cubit<AuthStates>{
//   AuthViewModel():super(AuthIntial());
//   UserModel? curruser;
//
//   Future<void>login({
//     required String email,
//     required String password,
// })async{
//     emit(LoginLoading());
//     try{
//       curruser=await FirebaseFunction.login
//         (email: email,
//           password: password);
//       emit(LoginSucess());
//     }catch(e){
//      emit(LoginError(e.toString()));
//     }
//
//   }
//   Future<void>register({
//     required String name,
//     required String email,
//     required String password,
// })async{
//     emit(RegisterLoading());
//     try{
//
//       curruser=await FirebaseFunction.
//       register(email: email,
//           name: name,
//           password: password);
//       emit(RegisterSucess());
//     }catch(e){
//       emit(RegisterError(e.toString()));
//     }
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/auth/models/user_model.dart';
import 'package:mychat/shared/firebase_utils.dart';

import 'auth_states.dart';

class AuthViewModel extends Cubit<AuthStates> {
  AuthViewModel() : super(AuthIntial());
  UserModel? curruser;
bool isLogined=false;
  Future<void>register({required String email,
    required String password,
    required String name,
  })async {
    emit(RegisterLoading());
    try {
      curruser = await FirebaseFunction.register
        (email: email, name: name, password: password);
      emit(RegisterSucess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
    Future<void> login({required String email,
        required String password,})async{
      emit(LoginLoading());
      try{
        curruser=await FirebaseFunction.login(email: email,
            password: password);
        emit(LoginSucess());
      }catch(e){
        emit(LoginError(e.toString()));
      }
  }
  Future<void>logOut()async{
    emit(LogOutLoading());
    try{
      await FirebaseFunction.signOut();
      curruser=null;
      emit(LogOutSucess());
    }catch(error){
      emit(LoginError(error.toString()));
    }
  }

Future<void> checkLoginStatus()async{
curruser=await FirebaseFunction.hasUser();
  }
}
