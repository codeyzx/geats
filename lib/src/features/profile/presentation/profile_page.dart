import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:geats/src/common_widgets/async_value/async_value_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:geats/src/routes/extras.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quickalert/quickalert.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controller = ref.read(commonControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: AsyncValueWidget(
        value: state.userValue,
        error: (errorWidget) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Something went wrong!',
                  style: TypographyApp.headline3,
                ),
              ),
              Gap.h16,
              // button to exit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#DB3F3F'),
                    minimumSize: Size(0.8.sw, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Exit',
                    style: TypographyApp.whiteOnBtnSmall,
                  ),
                ),
              ),
            ],
          );
        },
        data: (data) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    data?.profileUrl != null && data?.profileUrl != ''
                        ? CachedNetworkImage(
                            imageUrl: data?.profileUrl ?? '',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 30.r,
                              backgroundImage: imageProvider,
                              backgroundColor: Colors.white,
                            ),
                          )
                        : CircleAvatar(
                            radius: 30.r,
                            backgroundImage: const AssetImage(
                                'assets/images/profile_default_img.png'),
                            backgroundColor: Colors.white,
                          ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 220.w,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${data?.name}',
                                style: TypographyApp.homeDetName,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          '${data?.email}',
                          style: TypographyApp.profileJob,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 1.sw,
                  height: 0.6.h,
                  color: HexColor('#929DAB'),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Your Account",
                  style: TypographyApp.profileItemTitle,
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(
                      Routes.editProfile.name,
                      extra: Extras(
                        datas: {
                          ExtrasKey.user: data,
                        },
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_rounded,
                        color: HexColor('#5F6C7B'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 0.8.sw,
                        padding: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: HexColor('#E5E5E5'),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit Profile",
                              style: TypographyApp.profileItem,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: HexColor('#606060'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () async {
                    // await analyzeController.add();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lock_rounded,
                        color: HexColor('#5F6C7B'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 0.8.sw,
                        padding: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: HexColor('#E5E5E5'),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Change Password",
                              style: TypographyApp.profileItem,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: HexColor('#606060'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  "Support",
                  style: TypographyApp.profileItemTitle,
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email_rounded,
                        color: HexColor('#5F6C7B'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 0.8.sw,
                        padding: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: HexColor('#E5E5E5'),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Contact",
                              style: TypographyApp.profileItem,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: HexColor('#606060'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.report_rounded,
                        color: HexColor('#5F6C7B'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 0.8.sw,
                        padding: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: HexColor('#E5E5E5'),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Report a Problem",
                              style: TypographyApp.profileItem,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: HexColor('#606060'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  "Others",
                  style: TypographyApp.profileItemTitle,
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.library_books_rounded,
                        color: HexColor('#5F6C7B'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 0.8.sw,
                        padding: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: HexColor('#E5E5E5'),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Terms & Conditions",
                              style: TypographyApp.profileItem,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: HexColor('#606060'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: 'Are you sure?',
                        text: 'Do you want to logout',
                        backgroundColor: Colors.white,
                        showCancelBtn: true,
                        cancelBtnText: 'Cancel',
                        confirmBtnText: 'Logout',
                        confirmBtnColor: HexColor('#DB3F3F'),
                        onConfirmBtnTap: () {
                          controller.logout();
                        });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: HexColor('#DB3F3F'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 0.8.sw,
                        padding: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: HexColor('#E5E5E5'),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Logout",
                              style: TypographyApp.profileItemRed,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: HexColor('#DB3F3F'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
