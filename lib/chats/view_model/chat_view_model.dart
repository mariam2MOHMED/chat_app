import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/auth/models/user_model.dart';
import 'package:mychat/chats/data/models.dart';
import 'package:mychat/chats/view_model/chat_states.dart';
import 'package:mychat/shared/firebase_utils.dart';

class ChatViewModel extends Cubit<ChatStates> {
  ChatViewModel() : super(ChatInital());

late final  UserModel currentuser;
  late final  String roomId;

final messageController =TextEditingController();

  Future<void>sendMessage()async{
    if(messageController.text!.isEmpty){
      return;
    }
    emit(SendMessageLoading());

    try{
      final meesagecontent=messageController.text;
      await FirebaseFunction.insertMessage(
        MessageModel(content: meesagecontent,
            dateTime: DateTime.now(),
            senderId: currentuser.id,
            senderName: currentuser.name,
roomId: roomId
        )
      );
      messageController.clear();
      emit(SendMessageSucess());
    }catch(error){
      emit(SendMessageError(error.toString()));
    }
  }
  Future<void>getMessagesStreams()async{
    emit(GetMessageLoading());
    try{
 final    messageStreams= await FirebaseFunction.getRoomMessages(roomId);
      emit(GetMessageSucess(messageStreams));
    }catch(error){
      emit(GetMessageError(error.toString()));}}
  bool isMyMessage(String SenderId)=>
      SenderId==currentuser.id;
}
