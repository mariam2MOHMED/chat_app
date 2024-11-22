import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mychat/shared/app_theme.dart';
import 'package:mychat/auth/view/screens/login_screen.dart';

import 'package:mychat/auth/view/screens/register_screen.dart';
import 'package:mychat/auth/view_model/auth_view_model.dart';
import 'package:mychat/firebase_options.dart';
import 'package:mychat/home_screen.dart';
import 'package:mychat/shared/bloc_observer.dart';
import 'package:mychat/shared/fcm.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:mychat/shared/splash_screen.dart';
import 'chats/view/screen/chat_screen.dart';
import 'rooms/view/screens/create_room.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // Fcm.fcmInit();
  runApp(BlocProvider(
    create: (context) => AuthViewModel(),
    child: ChatApp(),
  ));
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  late final AuthViewModel authViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authViewModel=BlocProvider.of<AuthViewModel>(context)..checkLoginStatus();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
         RegisterScreen.routeName: (_) => RegisterScreen(),
          LoginScreen.routeName:(_)=>LoginScreen(),
          HomeScreen.routeName:(_)=>HomeScreen(),
        createRoom.routeName:(_)=>createRoom(),
        ChatScreen.routeName: (_) => ChatScreen(),
        SplashScreen.routeName:(_)=>SplashScreen(),
      },
      initialRoute:authViewModel.curruser==null?
      RegisterScreen.routeName:
      HomeScreen.routeName,
    );
  }
}
