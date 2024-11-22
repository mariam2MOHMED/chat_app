import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mychat/chats/data/models.dart';
import 'package:mychat/shared/app_theme.dart';

class SentMessage extends StatelessWidget {
  MessageModel messageModel;
  SentMessage({required this.messageModel,
    super.key});

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(DateFormat.jm().format(messageModel.dateTime),style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: AppTheme.black
          ),),
          SizedBox(width: 10.0,),

          Flexible(
            child: Container(
              decoration:BoxDecoration(
                color: AppTheme.primarycolor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
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

        ],
      );
  }
}
