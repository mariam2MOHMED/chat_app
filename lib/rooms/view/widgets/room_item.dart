// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mychat/rooms/view_models/rooms_view_model.dart';
// import 'package:mychat/shared/app_theme.dart';
//
// import '../../../chats/view/screen/chat_screen.dart';
// import '../../data/models/category_model.dart';
// import '../../data/models/room_model.dart';
//
// class RoomItem extends StatelessWidget {
//   RoomModel roomModel;
//    RoomItem({
//      required this.roomModel
//      ,super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final String categoryImageName=
//        BlocProvider.of<RoomViewModel>(context).getCategoryImageName(roomModel.categoryId);
//     return InkWell(
//       onTap: (){
//         Navigator.of(context).pushNamed(ChatScreen.routeName);
//       },
//       child: Material(
//         elevation: 16.0,
//
//         shadowColor: AppTheme.grey,
//         borderRadius: BorderRadius.circular(20.0),
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//
//           child: Container(
//             padding:
//             EdgeInsets.all(8),
//             child: Column(
//               children: [
//                 Image.asset(
//          'assets/images/${categoryImageName}.png',
//                   height: 90.0,),
//                 SizedBox(height: 7.0,),
//                 Text(roomModel.name,style: Theme.of(context).textTheme.headlineMedium,),
//                 SizedBox(height: 5.0,),
//                 Text(roomModel.desc,
//                   maxLines: 2,
//                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//
//                     overflow: TextOverflow.ellipsis,
//
//                   ),),
//               ],
//             ),
//           )),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychat/chats/view/screen/chat_screen.dart';
import 'package:mychat/rooms/data/models/room_model.dart';
import 'package:mychat/shared/app_theme.dart';

class RoomItem extends StatelessWidget {
  RoomModel roomModel;
   RoomItem({
     required this.roomModel,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(
            ChatScreen.routeName,arguments: roomModel.id);
      },
      child: Material(
      elevation: 16,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(20),
        shadowColor:Colors.grey ,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppTheme.white,

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/${roomModel.categoryId}.png',height: 100.0,),
              SizedBox(height: 7.0,),
              Text(roomModel.name,
                style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: 5.0,),
              Text(roomModel.desc,maxLines: 1,
                overflow: TextOverflow.ellipsis,
              style:   Theme.of(context).textTheme.headlineSmall,
          ),
          ]
        ),
      )),
    );
  }
}
