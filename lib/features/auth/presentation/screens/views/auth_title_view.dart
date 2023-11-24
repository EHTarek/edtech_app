import 'package:flutter/material.dart';

class AuthTitleView extends StatelessWidget {
  const AuthTitleView({super.key,required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: AppBar().preferredSize.height - 16,
      child: Text(title),
    );
  }
}
