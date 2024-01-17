import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/common_widgets/input_form/dropdown_form_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/shared/extensions/dynamic.dart';

class QuestionDropDownForm extends ConsumerWidget {
  const QuestionDropDownForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controller = ref.read(commonControllerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownFormWidget(
          value: state.gender,
          list: const [
            {'value': 'Male', 'text': 'Male'},
            {'value': 'Female', 'text': 'Female'},
          ],
          prefixIcon: Icons.wc,
          onChanged: (value) {
            if (value.isNotNull()) {
              controller.setGender(value.toString());
            }
          },
        ),
        Gap.h12,
        DropdownFormWidget(
          value: state.age,
          list: state.ageList,
          prefixIcon: Icons.looks_one,
          onChanged: (value) {
            if (value.isNotNull()) {
              controller.setAge(value.toString());
            }
          },
        ),
        Gap.h12,
      ],
    );
  }
}
