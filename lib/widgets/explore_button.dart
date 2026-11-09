import 'package:flutter/material.dart';
import 'package:space_app/core/app_color.dart';

class ExploreButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ExploreButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: const StadiumBorder(),
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.arrow_forward, size: 24),
          ],
        ),
      ),
    );
  }
}