import 'package:dictionary/app/theme/app_colors.dart';
import 'package:dictionary/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyStateWidget extends StatelessWidget {
  final String description;
  const EmptyStateWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150.0),
      child: Column(
        children: [
          Lottie.asset(
            'assets/empty_state.json',
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              description,
              style: appTextStyle.withColor(white),
            ),
          )
        ],
      ),
    );
  }
}
