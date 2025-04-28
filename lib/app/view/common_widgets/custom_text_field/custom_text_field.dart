import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/app/utils/app_colors/app_colors.dart';
import 'package:recipe_app/app/utils/custom_assets/assets.gen.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.inputFormatters,
    this.onFieldSubmitted,
    this.textEditingController,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = Colors.black,
    this.isColor = false, // Default value for isColor
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.maxLines = 1,
    this.validator,
    this.hintText ,
    this.hintStyle ,
    this.fillColor = Colors.white,
    this.suffixIcon,
    this.suffixIconColor,
    this.fieldBorderRadius = 0,
    this.fieldBorderColor = AppColors.gray,
    this.isPassword = false,
    this.isPrefixIcon = true,
    this.readOnly = false,
    this.maxLength,
    super.key,
    this.prefixIcon,
    this.onTap,
  });

  final TextEditingController? textEditingController;
  final FocusNode? focusNode;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final bool? isColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double fieldBorderRadius;
  final Color fieldBorderColor;
  final bool isPassword;
  final bool isPrefixIcon;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap; // Callback function for onTap

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.inputTextStyle ??
        TextStyle(
          color: widget.isColor! ? Colors.white : Colors.red,
        );

    return TextFormField(

      onTap: widget.onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorColor: widget.cursorColor,
      style: textStyle,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 16.sp,
        ),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor,
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: toggle,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: obscureText
                ? Assets.icons.ispassword.svg()
                : Assets.icons.ispassword.svg(),
          ),
        )
            : widget.suffixIcon,
        suffixIconColor: widget.suffixIconColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 14.h),
        // BOTTOM BORDER ONLY
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.fieldBorderColor, width: 2),
        ),
      ),

    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
