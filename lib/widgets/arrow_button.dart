import 'package:flutter/material.dart';
import 'package:space_app/core/app_color.dart';

class ArrowButton extends StatelessWidget {
  final IconData buttonIcon;
  final VoidCallback onPressed;
  const ArrowButton({super.key, required this.buttonIcon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(12),
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      child: Icon(buttonIcon,
      size: 22,),
    );
  }
}


