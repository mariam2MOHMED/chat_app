// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mychat/rooms/data/models/category_model.dart';
// import 'package:mychat/rooms/data/models/room_model.dart';
// import 'package:mychat/rooms/view_models/rooms_states.dart';
// import 'package:mychat/shared/firebase_utils.dart';
//
// class RoomViewModel extends Cubit<RoomStates> {
//   RoomViewModel() : super(RoomIntial());
//   List<RoomModel>rooms=[];
//   Future<void>createRoom(RoomModel roomModel)async{
//     emit(createRoomLoading());
//     try{
//
//   await FirebaseFunction.createRoom(roomModel);
//   emit(createRoomSucess());
// }catch(error){
//   emit(createRoomError(error.toString()));
// }
//
//   }
//   Future<void>getRoom()async{
//    emit(getRoomLoading());
//     try{
//       rooms=await FirebaseFunction.getRoom();
//       print(rooms.length);
//       emit(getRoomSucess());
//     }catch(error){
//       emit(getRoomError(error.toString()));
//     }
//   }
//   String getCategoryImageName(String categoryId)
//   =>CategoryModel.categories.firstWhere((category) =>
//   category.id==categoryId).imageName;
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/rooms/data/models/room_model.dart';
import 'package:mychat/rooms/view_models/rooms_states.dart';
import 'package:mychat/shared/firebase_utils.dart';

class RoomViewModel extends Cubit<RoomStates> {
  RoomViewModel() : super(RoomInital());
  List<RoomModel>rooms=[];
  Future<void>createRooms(RoomModel roomModel)async{
  emit(createRoomLoading());
    try{
      await FirebaseFunction.createRoom(roomModel);
      emit(createRoomSucess());
    }catch(e){
      emit(createRoomError(e.toString()));
    }
  }
  Future<void>getRooms()async{
    emit(getRoomsLoading());
    try{
     rooms= await FirebaseFunction.getRooms();
      emit(getRoomsSucess());
    }catch(e){
      emit(getRoomsError(e.toString()));
    }
  }
}