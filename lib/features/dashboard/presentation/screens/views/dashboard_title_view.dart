import 'package:flutter/material.dart';

class DashboardTitleView extends StatelessWidget {
  const DashboardTitleView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}
