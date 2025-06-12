import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final TextEditingController textEditingController;
  final double? borderRadius;
  final double? height;
  final IconData? suffixIcon;
  final Color? filledColor;
  final Color? hintColor;
  final Widget? widget;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function()? onTap;
  final Function()? onPressed;
  final bool? readOnly;
  final double? spacing;

  const CustomTextFormField({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    required this.textEditingController,
    this.borderRadius,
    this.height,
    this.suffixIcon,
    this.filledColor,
    this.hintColor,
    this.widget,
    this.type,
    this.onSubmit,
    this.onTap,
    this.readOnly,
    this.spacing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: type ?? TextInputType.text,
        readOnly: readOnly ?? false,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 14.0,
          ),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          filled: true,
          fillColor: filledColor ?? Theme.of(context).colorScheme.surface,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorStyle: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 18,
            color: hintColor ?? Theme.of(context).colorScheme.onSecondary,
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              suffixIcon,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
