import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mychat/auth/models/user_model.dart';
import 'package:mychat/chats/data/models.dart';
import 'package:mychat/rooms/data/models/room_model.dart';


class FirebaseFunction{

static CollectionReference<UserModel> getUserCollection()=>FirebaseFirestore.instance.collection('users').
withConverter<UserModel>(fromFirestore: (docSnapshot,_)=>
    UserModel.fromJson(docSnapshot.data()!),
    toFirestore: (user,_)=>user.toJson());
static Future<UserModel>register({
  required String email,
  required String name,
  required String password,
})async{
 final crediental= await FirebaseAuth.instance.
  createUserWithEmailAndPassword(email: email, password: password);
  final user=UserModel(id: crediental.user!.uid,email: email,
      password: password, name: name);
  final getuser=getUserCollection();
 await getuser.doc(user.id).set(user);
  return user;
}

static Future<void>signOut()async=>await FirebaseAuth.instance.signOut();
static Future<UserModel>login({
  required String email,

  required String password,
})async{
  final crediental=await FirebaseAuth.instance.signInWithEmailAndPassword
    (email: email, password: password);
final user=_getUser(crediental.user!.uid);
return user;
}
static Future<UserModel>_getUser( String id)async{
  final userColl=getUserCollection();
  final docSnapShot=await userColl.doc(id).get();
  return docSnapShot.data()!;
}
static Future<UserModel?> hasUser()async{
  final firebaseUser=FirebaseAuth.instance.currentUser;
  if(firebaseUser==null){
return null;
  }
  final user=_getUser(firebaseUser.uid);
  return user;
}
static CollectionReference <RoomModel> getRoomsCollection()=>
    FirebaseFirestore.instance.collection('rooms').withConverter<RoomModel>
      (fromFirestore: (docSnapshot,_)=>
        RoomModel.fromJson(docSnapshot.data()!),
        toFirestore: (room,_)=>room.toJson());
static Future<void>createRoom(RoomModel roomModel)async{
  final getrooms=getRoomsCollection();
  final doc= getrooms.doc();
  roomModel.id=doc.id;
  return doc.set(roomModel);

}
static Future<List<RoomModel>>getRooms()async{
  final getrooms=getRoomsCollection();
 final   querySnapshot= await getrooms.get();
 return querySnapshot.docs.map((e) => e.data()).toList();
}
static  CollectionReference <MessageModel>
getMessageCollection(String roomId)=>
  getRoomsCollection().doc(roomId).collection("messages")
      .withConverter<MessageModel> (
      fromFirestore: (docSnapshot,_)=>
          MessageModel.fromJson(docSnapshot.data()!),
      toFirestore: (message,_)=>message.toJson());
static Future<void>insertMessage(MessageModel messageModel)async{
  final getRoomsColl=getMessageCollection(messageModel.roomId);
final doc=  getRoomsColl.doc();
  messageModel.roomId=doc.id;
  return doc.set(messageModel);
}
static Stream<List<MessageModel>>  getRoomMessages(String roomId){
  final getRoomsColl=getMessageCollection(roomId);
  return getRoomsColl.orderBy('dateTime').snapshots().map((querSnapshot) =>
      querSnapshot.docs.map
        ((docSnapshot) =>
          docSnapshot.data()).toList(),);
}
// static CollectionReference<RoomModel>  getRoomCollection()=>
//     FirebaseFirestore.instance.collection('rooms').
// withConverter<RoomModel>(
//     fromFirestore: (docsnapshot,_)=>
//         RoomModel.fromJson(docsnapshot.data()!),
//     toFirestore: (roommodel,_)=>roommodel.toJson());
//
// static Future<void>createRoom(RoomModel roomModel)async{
//   final getroomcoll=getRoomCollection();
//   final doc= getroomcoll.doc();
//   roomModel.id=doc.id;
//   return doc.set(roomModel);
// }
// static Future<List<RoomModel>>getRoom()async{
//   final getroomcoll=getRoomCollection();
//   final querySnapshot=await getroomcoll.get();
//   return querySnapshot.docs.
//   map((docSnapshot) => docSnapshot.data()).toList();
// }
}