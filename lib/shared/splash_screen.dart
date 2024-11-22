import 'package:flutter/material.dart';
import 'package:mychat/shared/widgets/loading_indictor.dart';

class SplashScreen extends StatelessWidget {
  static String routeName="/SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingIndicitor(),
    );
  }
}
