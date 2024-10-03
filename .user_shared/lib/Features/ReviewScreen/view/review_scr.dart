import 'dart:ui';

import 'package:dags_user/Common/utils/app_colors.dart';
import 'package:dags_user/Common/widgets/app_bar.dart';
import 'package:dags_user/Common/widgets/app_button_widgets.dart';
import 'package:dags_user/Common/widgets/app_shadow.dart';
import 'package:dags_user/Common/widgets/text_widgets.dart';
import 'package:dags_user/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Common/utils/image_res.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vendor Partner',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1C254E),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle change vendor partner
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Change',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontSize: 14)),
                      SizedBox(
                        width: 5.h,
                      ),
                      const Icon(Icons.refresh, color: Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
          dashLine(
            color: Colors.grey.shade400,
            width: 400.w,
          ),
          SizedBox(height: 16.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            height: 235.h,
            width: 330.w,
            decoration: appBoxDecoration(
                borderWidth: 1.h,
                borderColor: AppColors.primaryElement,
                radius: 12),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12.w)),
                      child: Image.asset(
                        ImageRes.reviewimage,
                        height: 170.h,
                        fit: BoxFit.fill,
                      )),
                  Container(
                    height: 55.h,
                    width: 350.w,
                    color: AppColors.documentButtonBg,
                    margin: EdgeInsets.only(left: 10.h),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Wash Dry Cleanings',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter"),
                        ),
                        Text(
                          'Gomti Nagar',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          dashLine(
            width: 380.w,
            color: Colors.grey.shade300,
          ),
          SizedBox(height: 16.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.all(10.h),
            height: 200.h,
            width: 370.w,
            decoration: appBoxDecoration(
                radius: 10.h, borderColor: AppColors.primaryElement),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Ratings',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter"),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    );
                  }),
                ),
                SizedBox(height: 8.h),
                const Text(
                  'My Review',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter"),
                ),
                 SizedBox(height: 8.h),
                const Text(
                  'Great Service!!\nEasy to book service and the staff was really helpful',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
              child: appButtons(
                  buttonText: "Confirm",
                  height: 50.h,
                  width: 345.w,
                  buttonBorderWidth: 1.5.h,
                  buttonTextColor: Colors.black,
                  anyWayDoor: () {
                    navKey.currentState?.pushNamedAndRemoveUntil("/profile_scr", (route) => false);
                  })),
        ],
      ),
    );
  }
}
