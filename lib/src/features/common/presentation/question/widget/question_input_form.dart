import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';

class QuestionInputForm extends ConsumerWidget {
  const QuestionInputForm({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controllerState = ref.read(commonControllerProvider.notifier);
    
    return Form(
      key: state.formKey,
      child: Column(
        children: [
          InputFormWidget(
            controller: controllerState.weightController,
            onChanged: (value) {},
            hintText: 'Weight',
            prefixIcon: Icons.monitor_weight,
            validator: controllerState.validateWeight,
          ),
          Gap.h4,
          InputFormWidget(
            controller: controllerState.heightController,
            onChanged: (value) {},
            hintText: 'Height',
            prefixIcon: Icons.leaderboard,
            validator: controllerState.validateHeight,
          ),  
        ],
      ) 
    );
  }
}