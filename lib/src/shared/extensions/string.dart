import 'package:flutter/material.dart';
import 'package:geats/src/features/auth/domain/user.dart';

extension XString on String {
  String get trimList => replaceAll('[', '').replaceAll(']', '');

  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  bool get isPasswordValid => length >= 8;

  String get capitalize =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get ind {
    switch (this) {
      case 'Monday':
        return 'Senin';
      case 'Tuesday':
        return 'Selasa';
      case 'Wednesday':
        return 'Rabu';
      case 'Thursday':
        return 'Kamis';
      case 'Friday':
        return 'Jumat';
      case 'Saturday':
        return 'Sabtu';
      case 'Sunday':
        return 'Minggu';
      default:
        return 'Senin';
    }
  }

  Gender get getGender {
    switch (this) {
      case 'Male':
        return Gender.male;
      case 'Female':
        return Gender.female;
      default:
        return Gender.male;
    }
  }

  Activity get getActivity {
    switch (this) {
      case 'rare':
        return Activity.rare;
      case 'medium':
        return Activity.medium;
      case 'active':
        return Activity.active;
      default:
        return Activity.rare;
    }
  }

  Activity get getActivityProfile {
    switch (this) {
      case 'Little or no exercise':
        return Activity.rare;
      case '2-3 exercise/weeks':
        return Activity.medium;
      case 'Very active':
        return Activity.active;
      default:
        return Activity.rare;
    }
  }

  WeightGoal get getWeightGoal {
    switch (this) {
      case 'lose':
        return WeightGoal.lose;
      case 'maintain':
        return WeightGoal.maintain;
      case 'gain':
        return WeightGoal.gain;
      default:
        return WeightGoal.lose;
    }
  }

  WeightGoal get getWeightGoalProfile {
    switch (this) {
      case 'Gain weight':
        return WeightGoal.gain;
      case 'Maintain weight':
        return WeightGoal.maintain;
      case 'Lose weight':
        return WeightGoal.lose;
      default:
        return WeightGoal.lose;
    }
  }

  IconData get filterIcon {
    switch (this) {
      case 'MUSIC':
        return Icons.music_note;
      case 'ART':
        return Icons.palette;
      case 'SPORTS':
        return Icons.sports_basketball;
      case 'CULINARY':
        return Icons.restaurant;
      case 'TECH':
        return Icons.computer;
      case 'LIFESTYLE':
        return Icons.favorite;
      case 'BUSINESS':
        return Icons.business;
      case 'EDUCATION':
        return Icons.school;
      case 'ENTERTAINMENT':
        return Icons.movie;
      case 'CHARITY':
        return Icons.volunteer_activism;
      case 'OTHER':
        return Icons.more_horiz;
      default:
        return Icons.more_horiz;
    }
  }
}
