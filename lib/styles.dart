import 'package:flutter/material.dart';

class AppColors {
  static const purple = Colors.purple;
  static final grey300 = Colors.grey[300];
  static const white = Colors.white;
  static const black = Colors.black;
}

class AppTextStyles {
  static const stationTitle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static const stationText = TextStyle(fontSize: 40);

  static const buttonText = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

class AppDecorations {
  static final roundedBox = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(20),
  );

  static final purpleButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.purple,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: const EdgeInsets.symmetric(vertical: 15),
  );
}
