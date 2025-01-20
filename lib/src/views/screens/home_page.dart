import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/core/theme/colors.dart';
import 'package:travel_app/core/utils/constants/image_constant.dart';
import 'package:travel_app/services/routing/routepath.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    ImageConstant.balloning: "Balloning",
    ImageConstant.hiking: "Hiking",
    ImageConstant.kayaking: "Kayaking",
    ImageConstant.snorkling: "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 8.h, right: 5.w, left: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black54,
              ),
              const Spacer(),
              Container(
                height: 5.h,
                width: 10.w,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "Discover",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.only(left: 0, right: 20),
                unselectedLabelColor: AppColors.black,
                labelColor: AppColors.black,
                controller: tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                dividerHeight: 0,
                tabs: [
                  const Tab(
                    text: "Places",
                  ),
                  const Tab(
                    text: "Inspiration",
                  ),
                  const Tab(
                    text: "Emotions",
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 2.h),
            height: 35.h,
            width: double.maxFinite,
            child: TabBarView(controller: tabController, children: [
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        try {
                          context.push(Routepath.viewScreen);
                        } catch (e) {
                          print("Navigation error: $e");
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        height: 35.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(ImageConstant.mountain),
                                fit: BoxFit.cover)),
                      ),
                    );
                  }),
              const Text("There"),
              const Text("Bye"),
            ]),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Text(
                "Explore more",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "See All",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.textGreyColor),
              ),
              SizedBox(
                width: 1.w,
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 12.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: image.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12, left: 12),
                        height: 7.h,
                        width: 18.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(image.keys.elementAt(index)),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        image.values.elementAt(index),
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: AppColors.textGreyColor),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
