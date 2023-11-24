import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthErrorView extends StatelessWidget {
  const AuthErrorView({
    required this.message,
    required this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Icon(
              Icons.error_outline_rounded,
              size: 100,
              color: Colors.red.shade500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: const Text('Retry!'),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
