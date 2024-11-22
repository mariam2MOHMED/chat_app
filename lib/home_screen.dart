// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mychat/rooms/view/screens/create_room.dart';
// import 'package:mychat/rooms/view/widgets/room_item.dart';
// import 'package:mychat/rooms/view_models/rooms_states.dart';
// import 'package:mychat/rooms/view_models/rooms_view_model.dart';
// import 'package:mychat/shared/widgets/error_indictor.dart';
// import 'package:mychat/shared/widgets/loading_indictor.dart';
//
// class HomeScreen extends StatefulWidget {
//   static String routeName = "/HomeScreen";
//
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final viewModel = RoomViewModel();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     viewModel.getRoom();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//
//       create: (BuildContext context) => viewModel,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             image: DecorationImage
//               (image: AssetImage
//               ('assets/images/background.png'), fit: BoxFit.fill)
//         ),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Create Room"),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed(CreateRoom.routeName).
//               then((value) => viewModel.getRoom());
//             },
//             child: Icon(Icons.add, size: 27.0,),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.only(right: 20.0,
//                 left: 20.0,
//                 top: 32
//             ),
//             child: BlocBuilder<RoomViewModel, RoomStates>(
//
//               builder: (context, state) {
//                 if(state is getRoomLoading){
// return LoadingIndicitor();
//                 }else if(state is getRoomError){
//                   return ErrorIndictor();
//                 }else {
//                   return GridView.builder(
//                       itemCount: viewModel.rooms.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2, mainAxisSpacing:
//                       15, crossAxisSpacing: 15),
//                       itemBuilder: (context, index) =>
//                           RoomItem(
//                             roomModel: viewModel.rooms[index],
//                           ));
//                 }
//
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/auth/view/screens/login_screen.dart';
import 'package:mychat/auth/view_model/auth_states.dart';
import 'package:mychat/auth/view_model/auth_view_model.dart';
import 'package:mychat/rooms/view/screens/create_room.dart';
import 'package:mychat/rooms/view/widgets/room_item.dart';
import 'package:mychat/rooms/view_models/rooms_states.dart';
import 'package:mychat/rooms/view_models/rooms_view_model.dart';
import 'package:mychat/shared/app_theme.dart';
import 'package:mychat/shared/ui_utils.dart';
import 'package:mychat/shared/widgets/error_indictor.dart';
import 'package:mychat/shared/widgets/loading_indictor.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewmodel = RoomViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getRooms();
  }

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, createRoom.routeName).
              then((value) => viewmodel.getRooms());
            },
            child: Icon(Icons.add, size: 28.0,),
          ),
          appBar: AppBar(
            title: Text("Home Screen"),
            actions: [
              BlocConsumer<AuthViewModel, AuthStates>(
                listener: (context, state) {
      if(state is LogOutSucess){
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }else if (state is LogOutError){
        UiUtils.showMessage(state.error, Colors.red);
      }
                },
                builder: (context, state) {
    if (state is LogOutLoading)
    {
      return LoadingIndicitor();
    }else {
      return IconButton(onPressed: () {
        BlocProvider.of<AuthViewModel>(context).logOut();
      }, icon: Icon(
        Icons.logout_outlined, size: 28.0,
        color: AppTheme.white,
      ));
    }

                },
              )
            ],
          ),
          body: BlocBuilder<RoomViewModel, RoomStates>(
            builder: (BuildContext context, RoomStates state) {
              if (state is getRoomsLoading) {
                return LoadingIndicitor();
              } else if (state is getRoomsError) {
                return ErrorIndictor();
              } else {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GridView.builder(
                      itemCount: viewmodel.rooms.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) =>
                          RoomItem(
                            roomModel: viewmodel.rooms[index],
                          )),
                );
              }
            },


          )
          ,
        ),
      ),
    );
  }
}

