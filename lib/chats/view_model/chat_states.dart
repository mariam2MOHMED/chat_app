

import 'package:mychat/chats/data/models.dart';

abstract class ChatStates{}
class ChatInital extends ChatStates{}
class SendMessageLoading extends ChatStates{}
class SendMessageSucess extends ChatStates{}
class SendMessageError extends ChatStates{
  final String error;

  SendMessageError(this.error);
}
class GetMessageLoading extends ChatStates{}
class GetMessageSucess extends ChatStates{
  final Stream<List<MessageModel>> messageStreams;

  GetMessageSucess(this.messageStreams);
}
class GetMessageError extends ChatStates{
  final String error;

  GetMessageError(this.error);
}