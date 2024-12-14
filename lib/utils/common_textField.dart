import 'package:flutter/material.dart';
import 'package:trackroutine/constants/colors.dart';

class CustomTextField {
  /// Creates a standard TextField with customizable properties
  ///
  /// [context] is the BuildContext
  /// [controller] is the TextEditingController for the field
  /// [label] is the text displayed as the label
  /// [hint] is the hint text for the field
  /// [validator] is an optional validation function
  /// [keyboardType] specifies the type of keyboard to show
  /// [obscureText] determines if the text should be hidden (for passwords)
  /// [suffixIcon] allows adding an optional suffix icon
  static TextField build({
    required BuildContext context,
    TextEditingController? controller,
    String? label,
    String? hint,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    bool enabled = true,
    int? maxLines = 1,
    void Function(String)? onChanged,
    TextInputAction? textInputAction,
    void Function(String?)? onSaved,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: kPrimarykColors,
            width: 2,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: maxLines,
      onChanged: onChanged,
      textInputAction: textInputAction,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  /// Creates a form TextField with validation
  ///
  /// Includes additional form-specific properties like [validator]
  static TextFormField buildForm({
    required BuildContext context,
    TextEditingController? controller,
    String? label,
    String? hint,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    bool enabled = true,
    int? maxLines = 1,
    void Function(String?)? onSaved,
    TextInputAction? textInputAction,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: kPrimarykColors,
            width: 2,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: maxLines,
      validator: validator,
      onSaved: onSaved,
      textInputAction: textInputAction,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}