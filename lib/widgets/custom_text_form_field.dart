import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final bool obscureText;
  final String errorText;
  final TextEditingController controller;

  CustomTextFormField({
    this.labelText,
    this.textInputType,
    this.obscureText,
    this.errorText,
    this.controller,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(432.0, 816.0), allowFontScaling: true);

    return Material(
      elevation: 3.0.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.h),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.white,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontFamily: 'WorkSans',
          ),
          contentPadding:
              EdgeInsets.only(left: 15.w, bottom: 11.h, top: 11.h, right: 15.w),
        ),
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText,
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              //TODO: figure out this!
              // _showSpinner = false;
            });
            return widget.errorText;
          }
          return null;
        },
      ),
    );
  }
}
