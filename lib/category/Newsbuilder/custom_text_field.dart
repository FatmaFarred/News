import 'package:News/APP%20Utilies/fonts.dart';
import 'package:flutter/material.dart';

import '../../APP Utilies/app colors.dart';


typedef MyValidator = String? Function(String?);
typedef MyOnChanged= void Function(String) ;

class CustomTextField extends StatelessWidget {
  Widget? suffixIcon;
  TextStyle? hintTextStyle;
  Color ? BoderColor;
  Widget? prefixIcon;
  String? hintText;
  bool obscureText;
  MyValidator? validator;
  TextEditingController? controller;
  TextInputType? keyBoardType;
  MyOnChanged? onChanged;
  CustomTextField(
      { this.onChanged,
        this.suffixIcon,
        this.BoderColor,
        this.hintTextStyle,
      this.prefixIcon,
      this.hintText,
        this.keyBoardType,
      this.controller,
      this.obscureText = false,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      keyboardType: keyBoardType,
      style: AppFontStyles.white20medium,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        errorStyle: AppFontStyles.white20medium,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.white,
        prefixIcon: prefixIcon,
        //prefixIconColor: AppColors.white,
        hintText: hintText,
        hintStyle: hintTextStyle,
        filled: false,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide(
              color: BoderColor??AppColors.black,
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide(
              color:BoderColor??AppColors.black,
              width: 2,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide(
              color: BoderColor??AppColors.black,
              width: 2,
            )
        ),
        focusedErrorBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide:  BorderSide(
    color: BoderColor??AppColors.black,
    width: 2,
    )

      ),
      ),
    );
  }
}
