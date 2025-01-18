import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/core/theme/colors.dart';
import 'package:travel_app/core/utils/constants/image_constant.dart';
import 'package:travel_app/core/utils/constants/static_text_constant.dart';
import 'package:travel_app/src/widgets/responsive_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [
    ImageConstant.welcomeOne,
    ImageConstant.welcomeTwo,
    ImageConstant.welcomeThree
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.only(top: 16.h, right: 4.w, left: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trips",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontSize: 25.px, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Mountain",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontSize: 25.px, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            "Mountain hikes give you\nan incredible sense of freedom\nalong with endurance tests",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontSize: 14.px,
                                    color: AppColors.textGreyColor),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        ResponsiveButton(
                          width: 30.w,
                        )
                      ],
                    ),
                    Column(
                        //mainAxisAlignment: MainA,
                        children: List.generate(3, (indexDots) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3)),
                      );
                    }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
