import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/auth/domain/user.dart';
import 'package:geats/src/features/profile/presentation/profile_controller.dart';
import 'package:geats/src/features/profile/presentation/profile_state.dart';
import 'package:geats/src/routes/routes.dart';
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:quickalert/quickalert.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key, required this.user});

  final User? user;

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  UserController get controller => ref.read(userControllerProvider.notifier);
  UserState get state => ref.watch(userControllerProvider);
  TextEditingController get name => controller.nameController;
  TextEditingController get price => controller.priceController;
  TextEditingController get poly => controller.polyController;

  @override
  void initState() {
    safeRebuild(() {
      controller.setData(widget.user!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorApp.secondary,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          "Edit Profile",
          style: TypographyApp.homeAppbarSmall,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AsyncValueWidget(
            value: state.userValue,
            loading: (loadingWidget) {
              return Container(
                margin:
                    EdgeInsets.only(top: context.screenHeightPercentage(0.3)),
                child: loadingWidget,
              );
            },
            data: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                data?.profileUrl == ''
                    ? Center(
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundImage: const AssetImage(
                              'assets/images/profile_default_img.png'),
                          backgroundColor: Colors.white,
                        ),
                      )
                    : Center(
                        child: CachedNetworkImage(
                          imageUrl: data?.profileUrl ?? '',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 50.r,
                            backgroundImage: imageProvider,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Ubah Foto",
                      style: TypographyApp.eprofileBlueBtn,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Nama",
                  style: TypographyApp.eprofileLabel,
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E5E5E5'),
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E5E5E5'),
                        width: 1.w,
                      ),
                    ),
                  ),
                  style: TypographyApp.eprofileValue,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Price",
                  style: TypographyApp.eprofileLabel,
                ),
                TextFormField(
                  controller: price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E5E5E5'),
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E5E5E5'),
                        width: 1.w,
                      ),
                    ),
                  ),
                  style: TypographyApp.eprofileValue,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Polyclinic",
                  style: TypographyApp.eprofileLabel,
                ),
                TextFormField(
                  controller: poly,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E5E5E5'),
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E5E5E5'),
                        width: 1.w,
                      ),
                    ),
                  ),
                  style: TypographyApp.eprofileValue,
                ),
                SizedBox(
                  height: 150.h,
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        width: 1.sw,
        height: 98.h,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: HexColor('#929DAB').withOpacity(0.10),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.primary,
            padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 18.h),
          ),
          onPressed: state.loadingValue is AsyncLoading
              ? null
              : () async {
                  await controller.updateProfile();
                  Future.delayed(const Duration(seconds: 1), () {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Success Update Profile',
                        showCancelBtn: false,
                        barrierDismissible: false,
                        confirmBtnText: 'Go to Home',
                        onConfirmBtnTap: () {
                          context.goNamed(Routes.botNavBar.name);
                        });
                  });
                },
          child: state.loadingValue is AsyncLoading
              ? const LoadingWidget()
              : Text(
                  'Ubah',
                  style: TypographyApp.homeOnBtn,
                ),
        ),
      ),
    );
  }
}
