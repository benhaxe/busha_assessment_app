import 'package:busha_app/src/scaler/scaler.dart';
import 'package:flutter/material.dart';
import 'package:busha_app/src/extensions/src/context_on_theme_extension.dart';
import 'package:busha_app/src/values/colors/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? initialValue;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final double? borderRadius;
  final FormFieldValidator<String?>? validator;

  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.initialValue,
    this.suffix,
    this.prefix,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.onChanged,
    this.contentPadding,
    this.fillColor = const Color(0xFFEBEBEB),
    this.borderRadius = 5,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          const YMargin(16),
          Text(label!),
        ],
        TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          controller: controller ?? TextEditingController(text: initialValue),
          focusNode: focusNode,
          cursorColor: AppColors.subHeading,
          textCapitalization: TextCapitalization.characters,
          style: context.textTheme.bodyMedium,
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.disabled,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: fillColor != null,
            hintText: hint,
            hintStyle: context.textTheme.bodyMedium!.apply(
              color: AppColors.neutralN400,
            ),
            contentPadding: contentPadding ?? context.insetsAll(12),
            prefixIcon: prefix,
            suffixIcon: suffix,
            suffixIconColor: AppColors.neutralN400,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
        ),
      ],
    );
  }
}
