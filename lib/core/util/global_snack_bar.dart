import 'package:edtech_app/constants/theme/style.dart';
import 'package:flutter/material.dart';

class GlobalSnackBar {
  const GlobalSnackBar({
    required this.message,
  });

  final String message;

  static show({
    required BuildContext context,
    required String message,
    int duration = 5,
    Color color = Style.kSnackBarErrorColor,
    String label = 'ok',
    VoidCallback? onPressed,
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    TextAlign textAlign = TextAlign.center,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          textAlign: textAlign,
          style: textStyle,
        ),
        duration: Duration(
          seconds: duration,
        ),
        // action: SnackBarAction(
        //   // textColor: Colors.white,
        //   label: label,
        //   onPressed: onPressed ?? () {},
        // ),
      ),
    );
  }
}