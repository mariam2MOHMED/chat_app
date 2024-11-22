import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/auth/models/user_model.dart';
import 'package:mychat/auth/view_model/auth_view_model.dart';
import 'package:mychat/chats/data/models.dart';
import 'package:mychat/chats/view/widgets/sened_message.dart';
import 'package:mychat/chats/view/widgets/received_message.dart';
import 'package:mychat/chats/view_model/chat_states.dart';
import 'package:mychat/chats/view_model/chat_view_model.dart';
import 'package:mychat/shared/app_theme.dart';
import 'package:mychat/shared/widgets/error_indictor.dart';
import 'package:mychat/shared/widgets/loading_indictor.dart';

class ChatScreen extends StatefulWidget {
  static String routeName="/ChatScreen";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  final viewModel=ChatViewModel();
  List<MessageModel>messages=[];
 //final scrollcontroll=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
 viewModel.roomId=ModalRoute.of(context)!.settings!.arguments as String;
      viewModel.getMessagesStreams();  });
viewModel.currentuser=BlocProvider
    .of<AuthViewModel>(context).curruser!;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(image: AssetImage
            ('assets/images/background.png'),
              fit: BoxFit.fill)
        ),
        child: Scaffold(
extendBodyBehindAppBar: true,
          //resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(""),
            forceMaterialTransparency: true,
          ),
          body: Container(
        width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.1,
              vertical:  MediaQuery.of(context).size.height*0.02,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                 color: AppTheme.ligtgrey,
                 blurRadius: 4,
                 offset: Offset(4,4),

                )
              ],
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.white,

            ),

            child: Column(
              children: [
            BlocBuilder<ChatViewModel, ChatStates>(
              bloc: viewModel,
              buildWhen:(previous,current)=>previous is GetMessageLoading||
    current is GetMessageLoading,
              builder: (context, state) {

                if(state is GetMessageLoading){
                  return LoadingIndicitor();
                }else if(state is GetMessageSucess){
                  return StreamBuilder(
                    stream: state.messageStreams,
                    builder: (BuildContext context, snapshot) {
                      if(snapshot.hasData){
                        messages=snapshot.data!.reversed.toList();
                        // scrollcontroll.animateTo
                        //   (scrollcontroll.position.maxScrollExtent,
                        //     duration: Duration(
                        //       microseconds: 200
                        //     ),
                        //     curve: Curves.easeIn);
                      }

                      return  Expanded(
                        child: ListView.separated(
                          reverse: true,
//controller: scrollcontroll,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context,index) {
                              final message=messages[index];
                              final isMyMessage=viewModel.isMyMessage
                                (message.senderId,
                                  );
                              if(isMyMessage){
                                return SentMessage(messageModel: message);
                              }else{
                               return ReceivedMessage
                                 (messageModel: message) ;
                              }
                            },
                            separatorBuilder: (context,index)=>SizedBox(
                              height: 10,
                            ), itemCount: messages.length),
                      );
                    },

                  );
                }else if(state is GetMessageError){
                  return ErrorIndictor();
                }else{
                  return SizedBox();
                }

              },
            ),
      const SizedBox(height: 7.0,),
      Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: viewModel.messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a Message',
                          hintStyle: TextStyle(
                              color: AppTheme.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500
                          ),
                      
                          enabledBorder: OutlineInputBorder(
                      
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                      
                            ),
                      
                          ),
                          focusedBorder: OutlineInputBorder(
                      
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                      
                            ),
                      
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 7.0,),
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primarycolor,
                          foregroundColor: AppTheme.white,
                         fixedSize: Size(85, 50),
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ) ,
                        onPressed: (){
                          viewModel.sendMessage();
                          // viewModel.sendMessage(MessageModel(
                          //     content: viewModel.messageController.text,
                          //     dateTime: DateTime.now(),
                          //     senderId: currentUser.id,
                          //     senderName: currentUser.name));
                        }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Send  ",style: TextStyle(
                          color: AppTheme.white,
                          fontSize: 12.0
                        ),),
                        Icon(Icons.send_rounded,color: AppTheme.white,)
                      ],
                    ))
                  ],
                )
              ],
            ),
          ),

        ));
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   scrollcontroll.dispose();
  //   super.dispose();
  // }
}
