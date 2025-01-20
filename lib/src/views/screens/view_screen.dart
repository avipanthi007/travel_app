import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/core/theme/colors.dart';
import 'package:travel_app/core/utils/constants/image_constant.dart';
import 'package:travel_app/src/views/widgets/responsive_button.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  RxInt isSelected = (-1).obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.mountain), fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 4.w),
              height: 40.h,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu,
                    color: AppColors.white,
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: AppColors.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Yosemite",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        "\$ 250",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: AppColors.mainColor,
                      ),
                      Text(
                        "USA,Californnia",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 20,
                            color: index < 4 ? Colors.amber[600] : Colors.grey,
                          );
                        }),
                      ),
                      Text(
                        "(4.0)",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: AppColors.textGreyColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "People",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Number of people in your group",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.textGreyColor),
                  ),
                  Wrap(
                    children: List.generate(5, (index) {
                      return Obx(
                        () => kRepeatedButton(
                            onTap: () {
                              isSelected.value = index;
                            },
                            text: (index + 1).toString(),
                            icon: Icons.favorite_outline,
                            size: 60,
                            color: isSelected.value == index
                                ? AppColors.white
                                : AppColors.black,
                            backgroundColor: isSelected.value == index
                                ? AppColors.black
                                : AppColors.buttonBackground,
                            borderColor: AppColors.backgroundColor),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Yosemite National Park is located in central Sierra Nevada in the US state of california. It is located near the wild protected area",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.textGreyColor),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      kRepeatedButton(
                          onTap: () {},
                          isIcon: true,
                          icon: Icons.favorite_outline,
                          size: 65,
                          color: AppColors.black,
                          backgroundColor: AppColors.buttonBackground,
                          borderColor: AppColors.backgroundColor),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 6, right: 6, left: 6),
                          height: 65,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Book Trip Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: AppColors.white),
                              ),
                              Image.asset(ImageConstant.buttonOne)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget kRepeatedButton(
      {Color? color,
      IconData? icon,
      String? text,
      Color? backgroundColor,
      double? size,
      bool isIcon = false,
      Function()? onTap,
      Color borderColor = AppColors.buttonBackground}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 6, right: 6),
        height: size,
        width: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: isIcon
              ? Icon(
                  icon,
                  color: color,
                )
              : Text(
                  text.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500, color: color),
                ),
        ),
      ),
    );
  }
}
