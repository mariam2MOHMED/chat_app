// abstract class RoomStates{}
// class RoomIntial extends  RoomStates{}
// class createRoomLoading extends  RoomStates{}
// class createRoomSucess extends  RoomStates{}
// class createRoomError extends  RoomStates{
//   final String error;
//
//   createRoomError(this.error);
//
// }
// class getRoomLoading extends  RoomStates{}
// class getRoomSucess extends  RoomStates{}
// class getRoomError extends  RoomStates{
//   final String error;
//
//   getRoomError(this.error);
//
// }
abstract class RoomStates{}
class RoomInital extends RoomStates{}
class createRoomLoading extends RoomStates{}
class createRoomSucess extends RoomStates{}
class createRoomError extends RoomStates{
  final String error;

  createRoomError(this.error);
}
class getRoomsLoading extends RoomStates{}
class getRoomsSucess extends RoomStates{}
class getRoomsError extends RoomStates{
  final String error;

  getRoomsError(this.error);
}