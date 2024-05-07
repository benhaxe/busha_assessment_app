import 'package:flutter/material.dart';
import 'package:busha_app/src/scaler/src/extensions.dart';
import 'package:busha_app/src/values/colors/colors.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryGreen),
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        padding: MaterialStateProperty.all(
          context.insetsSymetric(
            vertical: 16,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(MediaQuery.sizeOf(context).width * .85, 45),
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.isLoading
          ? SizedBox(
              height: context.scaleY(20),
              width: context.scaleY(20),
              child: CircularProgressIndicator(
                value: controller.value,
                strokeWidth: 2,
                backgroundColor: AppColors.primaryGreen,
                color: AppColors.white,
              ),
            )
          : Text(widget.label),
    );
  }
}
