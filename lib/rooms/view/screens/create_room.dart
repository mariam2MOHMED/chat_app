// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mychat/auth/view/widgets/df_evalted_btn.dart';
// import 'package:mychat/auth/view/widgets/dft_txt_field.dart';
// import 'package:mychat/home_screen.dart';
// import 'package:mychat/rooms/data/models/room_model.dart';
// import 'package:mychat/rooms/view/widgets/categories_drop_down.dart';
// import 'package:mychat/rooms/view_models/rooms_states.dart';
// import 'package:mychat/rooms/view_models/rooms_view_model.dart';
// import 'package:mychat/shared/ui_utils.dart';
//
// import '../../../shared/app_theme.dart';
//
// class CreateRoom extends StatefulWidget {
//   static String routeName="/CreateRoom";
//    CreateRoom({super.key});
//    @override
//   State<CreateRoom> createState() => _CreateRoomState();
// }
//
// class _CreateRoomState extends State<CreateRoom> {
//   var namecontroll=TextEditingController();
//   var desccontroll=TextEditingController();
//   var fromkey=GlobalKey<FormState>();
//   String? selectcategory;
//   final viewModel=RoomViewModel();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//   create: (context) => viewModel,
//   child: Container(
//       decoration: BoxDecoration(
//           color: AppTheme.white,
//           image: DecorationImage(image: AssetImage
//             ('assets/images/background.png'),fit:BoxFit.fill )
//       ),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text("Create Room"),
//         ),
//         body: Container(
//
//           decoration: BoxDecoration(
//             boxShadow:[
// BoxShadow(
//   color: Colors.grey,
//   blurRadius: 16.0,
//   offset: Offset(4,4)
// )
//             ],
//             color: AppTheme.white,
//             borderRadius: BorderRadius.circular(16)
//           ),
//           margin: EdgeInsets.only(
//             top: MediaQuery.of(context).size.height*0.03,
//             right: 24.0,
//             left: 24.0,
//             bottom: MediaQuery.of(context).size.height*0.02,
//           ),
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: fromkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Create Room",style:
//                 Theme.of(context).textTheme.headlineMedium,),
//                 SizedBox(height: 12.0,),
//                 Image.asset('assets/images/room.png',
//                 fit: BoxFit.cover,
//                   height: MediaQuery.of(context).size.height*0.1,
//                 ),
//                 SizedBox(height: 12.0,),
//                 dftTextField(
//                     validator: (value){
//                       if(value!.isEmpty||value==null){
//                         return "Name Room must be not empty";
//                       }else if(value.length<3){
//                         return "Name Room must be more than 3 character";
//                       }else{
//                         return null;
//                       }
//                     },
//                     controller: namecontroll, hint: "Enter Room Name")
//                 ,SizedBox(height: 20.0,),
//                 dftTextField(
//                     validator: (value){
//                       if(value!.isEmpty||value==null){
//                         return "Description Room must be not empty";
//                       }else if(value.length<3){
//                         return "Description Room must be more than 3 character";
//                       }else{
//                         return null;
//                       }
//                     },
//                     controller: desccontroll,
//                     hint: "Enter Room Description")
//                 ,SizedBox(height: 20.0,),
//                 CategoriesDropDownBtn(
//                   onCategorySelected: (category)=>
//           setState(() {
//             selectcategory=category;
//           })
//
//                   ,
//                 )
//                 ,SizedBox(height: 20.0,),
//                 BlocListener<RoomViewModel, RoomStates>(
//   listener: (_, state) {
// if(state is createRoomLoading){
//   UiUtils.showDilog(context);
// }else if(state is createRoomSucess){
//   UiUtils.hideDialog(context) ;
//   UiUtils.showMessage("Room  created Sucessfully",
//       AppTheme.primarycolor);
// Navigator.of(context).pop();
// }else if(state is createRoomError){
//   UiUtils.hideDialog(context) ;
// UiUtils.showMessage(' Room doesnot created Sucessfully', Colors.redAccent);
// }
//   },
//   child: dftEvelatedBtn(txt: "Create",
//        onPress: createRoom,
//                 width: MediaQuery.of(context).size.width*0.7,
//                   borderRadiusValue: 32,
//                 ),
// )
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
// );
//   }
//   void createRoom() {
//     if (fromkey.currentState?.validate() == true) {
//       if (selectcategory == null) {
//         UiUtils.showMessage("Please select a category",
//             AppTheme.primarycolor);
//         return;
//       }
//       viewModel.createRoom(
//         RoomModel(
//           name: namecontroll.text,
//           desc: desccontroll.text,
//           categoryId: selectcategory!,
//         ),
//       );
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/auth/view/widgets/df_evalted_btn.dart';
import 'package:mychat/auth/view/widgets/dft_txt_field.dart';
import 'package:mychat/home_screen.dart';
import 'package:mychat/rooms/data/models/room_model.dart';
import 'package:mychat/rooms/view/widgets/categories_drop_down.dart';
import 'package:mychat/rooms/view_models/rooms_states.dart';
import 'package:mychat/rooms/view_models/rooms_view_model.dart';
import 'package:mychat/shared/app_theme.dart';

import '../../../shared/ui_utils.dart';

class createRoom extends StatefulWidget {
  static String routeName="/createRoom";
  const createRoom({super.key});

  @override
  State<createRoom> createState() => _createRoomState();
}

class _createRoomState extends State<createRoom> {
  var nameControll=TextEditingController();
  var desControll=TextEditingController();
  var fromkey=GlobalKey<FormState>();
  String? selectcategory;
  final viewmodel=RoomViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => viewmodel,
  child: Container(
        decoration: BoxDecoration(
            color: AppTheme.white,
            image: DecorationImage(image:
            AssetImage('assets/images/background.png'),
                fit: BoxFit.fill)
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
                        margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.1,
              vertical: MediaQuery.of(context).size.height*0.1,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 10,
                  color: AppTheme.grey
                )
              ],
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(16.0)
            ),
            child: Form(
              key: fromkey,
              child: Padding(
                padding: const EdgeInsets.symmetric
                  (horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/room.png',
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    SizedBox(height: 12.0,),
                    dftTxtField(controller: nameControll,
                        validator: (value){
                      if(value!.isEmpty||value==null){
                        return "Name must be not empty";
                      }else{
                        return null;
                      }
                    },hinttxt: 'Room Name'),
                    SizedBox(height: 12.0,),
                    dftTxtField(
                        maxlines: 4,
                        controller: desControll,      validator: (value){
                      if(value!.isEmpty||value==null){
                        return "Description must be not empty";
                      }else{
                        return null;
                      }
                    },hinttxt: 'Description Description'),
                    SizedBox(height: 12.0,),
                    categoriesDropDownBtn(

                        onPress: (category){
                      selectcategory=category;
                      setState(() {

                      });
                    }),
                    SizedBox(height: 16.0,),
                    BlocListener<RoomViewModel, RoomStates>(
                  listener: (_, state) {
                    // TODO: implement listener
                    if(state is createRoomLoading){
                      UiUtils.showDilog(context);
                    }
                    if(state is createRoomSucess){
                      UiUtils.hideDialog(context);
                      UiUtils.showMessage("Created Room",
                          AppTheme.primarycolor);
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed
                        (HomeScreen.routeName);

                    }
                    if(state is createRoomError){
                      UiUtils.hideDialog(context);
                      UiUtils.showMessage("something wrong ", Colors.redAccent);
                    }
                  },
                  child: dftEvaltedBtn(txt: "Create Room", onPress: createRoom),
                )
                  ],
                ),
              ),
            ),
          ),
        )),
);
  }
void createRoom() {
  if (fromkey.currentState!.validate()) {
    if(selectcategory==null){
      UiUtils.showMessage("Please select a category",
           AppTheme.primarycolor);
        return;
    }
viewmodel.createRooms(RoomModel(name: nameControll.text,
    desc: desControll.text, categoryId: selectcategory!));
  }
}
}
