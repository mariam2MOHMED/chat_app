import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mychat/chats/data/models.dart';
import 'package:mychat/shared/app_theme.dart';

class ReceivedMessage extends StatelessWidget {
  MessageModel messageModel;
   ReceivedMessage({required this.messageModel,super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(messageModel.senderName,style: Theme.of(context).textTheme.headlineSmall,),
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
              decoration:BoxDecoration(
                color: AppTheme.ligtgrey,
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
                ),

              ) ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,
                  vertical: 12.0
                  ),
                  child: Text(messageModel.content,style:
                  TextStyle(
                  color: AppTheme.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
                  ),),
                ),
              ),
            ),
            SizedBox(width: 10.0,),
            Text(DateFormat.jm().format(messageModel.dateTime),style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: AppTheme.black
            ),)
          ],
              ),
        ],
      );
  }
}
