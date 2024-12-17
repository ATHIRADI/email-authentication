import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  final String text;

  const PageHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
