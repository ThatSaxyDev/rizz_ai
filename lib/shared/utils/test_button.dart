import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  // final double height;
  // final double width;
  final void Function()? onTap;
  final String text;
  const Button({
    Key? key,
    // required this.height,
    // required this.width,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 300.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.black,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}