import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel{
  String id;
  final String content;
  final DateTime dateTime;
  final String senderId;
  final String senderName;
   String roomId;
  MessageModel({this.id='',
    required this.content,
    required this.dateTime,
    required this.senderId,
    required this.senderName,
   this.roomId=''
  });
  MessageModel.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    content: json['content'],
    dateTime: (json['dateTime']as Timestamp).toDate(),
    senderId: json['senderId'],
    senderName: json['senderName'],
      roomId:json["roomId"]
  );
  Map<String,dynamic> toJson()=>{
    'id':id,
    'content':content,
    'dateTime':dateTime,
    'senderId':senderId,
    'senderName':senderName,
    'roomId':roomId
  };
}