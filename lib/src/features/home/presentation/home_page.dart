import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:geats/src/features/common/presentation/question/question_page.dart';
import 'package:geats/src/features/home/presentation/home_controller.dart';
import 'package:geats/src/features/home/presentation/home_state.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  HomeController get controller => ref.read(homeControllerProvider.notifier);
  HomeState get state => ref.watch(homeControllerProvider);
  // CheckupController get checkupController =>
  //     ref.read(checkupControllerProvider.notifier);
  // CheckupState get checkupState => ref.watch(checkupControllerProvider);
  CommonState get commonState => ref.watch(commonControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      // controller.fetchHome(
      //   '${commonState.user?.id}',
      //   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      //   DateTime.now().add(const Duration(days: 1)),
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionPage(),
                      )),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
