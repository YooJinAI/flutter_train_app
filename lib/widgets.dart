import 'package:flutter/material.dart';
import 'styles.dart';

class StationSelector extends StatelessWidget {
  final String label;
  final String? station;
  final VoidCallback onTap;

  const StationSelector({
    super.key,
    required this.label,
    required this.station,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: AppTextStyles.stationTitle),
          const SizedBox(height: 10),
          Text(station ?? '선택', style: AppTextStyles.stationText),
        ],
      ),
    );
  }
}

class PurpleButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PurpleButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppDecorations.purpleButton,
        child: Text(text, style: AppTextStyles.buttonText),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      automaticallyImplyLeading: showBackButton,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
