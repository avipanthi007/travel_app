import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/core/theme/colors.dart';
import 'package:travel_app/core/utils/constants/image_constant.dart';

class ResponsiveButton extends StatelessWidget {
  final double width;
  final bool? isResponsive;
  const ResponsiveButton({super.key, this.width = 60.0,this.isResponsive});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: AppColors.mainColor, borderRadius: BorderRadius.circular(10)),
        height: 7.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(ImageConstant.buttonOne)],
        ),
      ),
    );
  }
}
