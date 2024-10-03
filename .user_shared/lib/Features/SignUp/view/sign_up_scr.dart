import 'package:dags_user/Common/widgets/text_widgets.dart';
import 'package:dags_user/Features/SignUp/view/widgets/sign_up_wdgts.dart';
import 'package:dags_user/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Common/utils/app_colors.dart';
import '../../../Common/utils/image_res.dart';
import '../../../Common/widgets/app_button_widgets.dart';
import '../../../Common/widgets/app_text_fields.dart';
import '../Controller/DeliveryPartnerController.dart';
import '../Provider/delivery_prt_notifier.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late DeliveryPartnerController _controller;
  final formKey = GlobalKey<FormState>();
  bool loading = true;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _controller = DeliveryPartnerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: Size(ScreenWidth, ScreenHeight),
        builder: (context, child) => SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Image.asset(
                            ImageRes.logo,
                            height: 40.h,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          deliveryPartnerText(),
                          deliveryPartnerText02(),
                          SizedBox(
                            height: 30.h,
                          ),
                          textLoginBoxWithDimensions(
                              height: 45.h,
                              width: 325.w,
                              hintText: "Full Name",
                              controller: _controller.nameController,
                              capitalization: TextCapitalization.words,
                              keyboardType: TextInputType.name,
                              validateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Enter your full name";
                                RegExp re = RegExp(r"^[A-Za-z ]{3,}$");
                                if (!re.hasMatch(value))
                                  return "Enter your full name";
                                if (value.startsWith(' ') ||
                                    value.endsWith(' '))
                                  return "Special characters are not allowed";
                                return null;
                              },
                              func: (value) {
                                ref
                                    .read(deliveryPrtNotifierProvider.notifier)
                                    .onUserNameChange(value);
                              }),
                          SizedBox(
                            height: 15.h,
                          ),
                          textLoginBoxWithDimensions(
                              height: 45.h,
                              width: 325.w,
                              hintText: "Phone No.",
                              prefixText: "+91 ",
                              keyboardType: TextInputType.number,
                              controller: _controller.phoneNoController,
                              validateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Enter your phone number";
                                RegExp re = RegExp(r"^\d{10}$");
                                if (!re.hasMatch(value))
                                  return "Enter valid phone number";
                                return null;
                              },
                              func: (value) {
                                ref
                                    .read(deliveryPrtNotifierProvider.notifier)
                                    .onUserPhoneNoChange(value);
                                if (value!.length > 10) {
                                  _controller.phoneNoController.value =
                                      TextEditingValue(
                                          text: value.substring(0, 10));
                                }
                              }),
                          SizedBox(
                            height: 300.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 29.w, right: 25.w),
                              child: appButtons(
                                  buttonText: "Next",
                                  buttonColor: AppColors.primaryElement,
                                  buttonTextColor: AppColors.primaryText,
                                  buttonBorderWidth: 2.h,
                                  anyWayDoor: () {
                                    setState(() {
                                      loading = false;
                                    });
                                    if (formKey.currentState!.validate()) {
                                      if (!loading)
                                        _controller.handleSignUp(ref);
                                      setState(() {
                                        loading = true;
                                      });
                                    } else
                                      setState(() {
                                        loading = true;
                                      });
                                  })),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                textcustomnormal(
                                  text:
                                      "By clicking on Next you are agreeing to our",
                                  align: TextAlign.center,
                                  fontSize: 14,
                                  fontfamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade500,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    navKey.currentState
                                        ?.pushNamed('/terms_scr');
                                  },
                                  child: textcustomnormal(
                                    text: "Terms and conditions.",
                                    align: TextAlign.center,
                                    fontSize: 14,
                                    fontfamily: "Inter",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          registerText03()
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
