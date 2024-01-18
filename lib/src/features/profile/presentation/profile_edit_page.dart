import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/input_form/dropdown_form_widget.dart';
import 'package:geats/src/features/auth/domain/request_user.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/auth/domain/user.dart';
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
  CommonController get controller =>
      ref.read(commonControllerProvider.notifier);
  CommonState get state => ref.watch(commonControllerProvider);

  TextEditingController get name => controller.nameController;
  TextEditingController get height => controller.heightController;
  TextEditingController get weight => controller.weightController;

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
      resizeToAvoidBottomInset: false,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              state.user?.profileUrl == ''
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
                        imageUrl: state.user?.profileUrl ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
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
                    "Change Photo",
                    style: TypographyApp.eprofileBlueBtn,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Name",
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
                "Height (cm)",
                style: TypographyApp.eprofileLabel,
              ),
              TextFormField(
                controller: height,
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
                "Weight (kg)",
                style: TypographyApp.eprofileLabel,
              ),
              TextFormField(
                controller: weight,
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
                "Age",
                style: TypographyApp.eprofileLabel,
              ),
              TextFormField(
                controller: controller.ageController,
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
                "Your Goals",
                style: TypographyApp.eprofileLabel,
              ),
              Gap.h12,
              DropdownFormWidget(
                value: state.weightGoal?.name ?? '',
                list: const [
                  {'value': 'gain', 'text': 'Gain weight'},
                  {'value': 'maintain', 'text': 'Maintain weight'},
                  {'value': 'lose', 'text': 'Lose weight'},
                ],
                prefixIcon: Icons.wc,
                onChanged: (value) {
                  controller.setWeightGoal(value);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Your Activity",
                style: TypographyApp.eprofileLabel,
              ),
              Gap.h12,
              DropdownFormWidget(
                value: state.activity?.name ?? '',
                list: const [
                  {'value': 'rare', 'text': 'Little or no exercise'},
                  {'value': 'medium', 'text': '2-3 exercise/weeks'},
                  {'value': 'active', 'text': 'Very active'},
                ],
                prefixIcon: Icons.wc,
                onChanged: (value) {
                  if (value.isNotNull()) {
                    controller.setActivity(value);
                  }
                },
              ),
              SizedBox(
                height: 150.h,
              )
            ],
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
          onPressed: state.isGetLoading is AsyncLoading
              ? null
              : () async {
                  final user = RequestUser(
                    id: state.user!.id,
                    name: controller.nameController.text,
                    height: double.parse(controller.heightController.text),
                    weight: double.parse(controller.weightController.text),
                    age: int.parse(controller.ageController.text),
                    activity: state.activity!.name,
                    weightGoal: state.weightGoal!.name,
                  );
                  final calculate = controller.calculateDiet(
                      isUpdateProfile: true,
                      gender: '${state.user?.gender.name}',
                      age: int.parse(controller.ageController.text),
                      weight: double.parse(controller.weightController.text),
                      height: double.parse(controller.heightController.text),
                      activity: state.activity!,
                      weightGoal: state.weightGoal!);

                  calculate['id'] = state.user?.id ?? '';

                  await controller.updateDiet(calculate);
                  await controller.updateProfile(user);
                  await controller.getProfile();

                  Future.delayed(const Duration(seconds: 1), () {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Success',
                        showCancelBtn: false,
                        barrierDismissible: false,
                        confirmBtnText: 'Go to Home',
                        onConfirmBtnTap: () {
                          context.goNamed(Routes.botNavBar.name);
                        });
                  });
                },
          child: state.isGetLoading is AsyncLoading
              ? const LoadingWidget()
              : Text(
                  "Save",
                  style: TypographyApp.homeOnBtn,
                ),
        ),
      ),
    );
  }
}
