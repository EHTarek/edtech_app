import 'package:flutter/material.dart';

class AuthLeadingView extends StatelessWidget {
  const AuthLeadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
