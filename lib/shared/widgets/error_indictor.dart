

import 'package:flutter/material.dart';
import 'package:mychat/shared/app_theme.dart';

class ErrorIndictor extends StatelessWidget {
  const ErrorIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Some thing went wrong!!",style: TextStyle(
      color: AppTheme.primarycolor,
      shadows: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.cyan
        )
      ]
    ),);
  }
}
