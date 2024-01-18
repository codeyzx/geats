import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/application/analyze_service.dart';
import 'package:geats/src/features/analyze/domain/meal.dart';
import 'package:geats/src/features/analyze/domain/meals.dart';
import 'package:geats/src/features/analyze/presentation/analyze_state.dart';
import 'package:geats/src/features/analyze/domain/daily_meals.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class AnalyzeController extends StateNotifier<AnalyzeState> {
  final AnalyzeService _analyzeService;

  AnalyzeController(this._analyzeService) : super(AnalyzeState());

  final searchController = TextEditingController();

  void getDate() {
    state = state.copyWith(
      dateValue: const AsyncLoading(),
    );

    final now = DateTime.now();
    final dateTemp = List.generate(10, (index) {
      return now.subtract(Duration(days: index));
    });
    final date = dateTemp.reversed.toList();
    state = state.copyWith(
      date: date,
      dateValue: AsyncData(date),
    );
  }

  void getDailyMeals(DateTime date, List<DailyMeals>? dailyMeals) {
    state = state.copyWith(
      dailyMealsValue: const AsyncLoading(),
    );

    DailyMeals? temp = dailyMeals?.firstWhere(
      (element) => element.date.toYyyyMMDd == date.toYyyyMMDd,
      orElse: () => DailyMeals(
        date: date,
        totalCalories: 0,
        totalFat: 0,
        totalProteins: 0,
        totalCarbs: 0,
        totalSugars: 0,
        meals: [],
      ),
    );

    state = state.copyWith(
      dailyMeals: temp,
      dailyMealsValue: AsyncData(temp!),
      selectedDate: date,
      todayMeals: temp.meals,
    );
  }

  Future<void> getMeals() async {
    state = state.copyWith(
      mealsValue: const AsyncLoading(),
    );

    final result = await _analyzeService.getMeals();

    result.when(
      success: (data) {
        state = state.copyWith(
          meals: data,
          mealsValue: AsyncData(data),
          searchMeals: data,
          searchMealsValue: AsyncData(data),
          searchResults: [],
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          mealsValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void addQtyMeal(String id) {
    final temp = state.meals!;
    final index = temp.indexWhere((element) => element.id == id);
    temp[index] = temp[index].copyWith(
      qty: temp[index].qty + 1,
    );
    state = state.copyWith(
      searchMeals: temp,
      searchResults: temp,
    );
  }

  void removeQtyMeal(String id) {
    final temp = state.meals!;
    final index = temp.indexWhere((element) => element.id == id);
    if (temp[index].qty > 1) {
      temp[index] = temp[index].copyWith(
        qty: temp[index].qty - 1,
      );
    }
    state = state.copyWith(
      searchMeals: temp,
      searchResults: temp,
    );
  }

  void selectMeal(String id) {
    final temp = state.meals!;
    final index = temp.indexWhere((element) => element.id == id);
    temp[index] = temp[index].copyWith(
      isSelected: !temp[index].isSelected!,
    );
    state = state.copyWith(
      searchMeals: temp,
      searchResults: temp,
    );
  }

  void searchMeal(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        searchMeals: state.meals ?? [],
        searchMealsValue: AsyncData(state.meals ?? []),
      );
    }
    state = state.copyWith(
      searchMealsValue: const AsyncLoading(),
    );
    List<Meal> meals = state.meals ?? [];
    final result = meals
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    state = state.copyWith(
      searchMeals: result,
      searchMealsValue: AsyncData(result),
    );
  }

  Future<void> addMeal(List<Meal> meal, String date) async {
    state = state.copyWith(
      todayMealsValue: const AsyncLoading(),
    );

    final result = await _analyzeService.addMeal(meal, date);

    result.when(
      success: (data) {
        state = state.copyWith(
          todayMeals: data,
          todayMealsValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          todayMealsValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> add() async {
    List<Meals> meals = [
        Meals(
        name: 'Nasi Goreng',
        calories: 300,
        fat: 15,
        proteins: 10,
        carbs: 40,
        sugars: 5,
        image: 'https://spicebreeze.com/wp-content/uploads/2018/03/Nasi-Goreng-form-sq.jpg',
      ),
      Meals(
        name: 'Sate Ayam',
        calories: 180,
        fat: 10,
        proteins: 25,
        carbs: 15,
        sugars: 5,
        image: 'https://th.bing.com/th/id/OIP.hKG8ipuAlIS43OgHHJ9sowAAAA?rs=1&pid=ImgDetMain',
      ),
      Meals(
        name: 'Mie Goreng',
        calories: 250,
        fat: 12,
        proteins: 15,
        carbs: 35,
        sugars: 8,
        image: 'https://data.thefeedfeed.com/static/2021/02/04/1612498323601cc5936e88a.jpg',
      ),
      Meals(
        name: 'Gado-Gado',
        calories: 120,
        fat: 8,
        proteins: 10,
        carbs: 20,
        sugars: 5,
        image: 'https://www.recipetineats.com/wp-content/uploads/2020/06/Indonesian-Gado-Gado-SQ.jpg',
      ),
      Meals(
        name: 'Soto Ayam',
        calories: 150,
        fat: 7,
        proteins: 12,
        carbs: 25,
        sugars: 3,
        image: 'https://glebekitchen.com/wp-content/uploads/2019/11/sotoayamtopbowl.jpg',
      ),
      Meals(
        name: 'Rendang',
        calories: 350,
        fat: 25,
        proteins: 30,
        carbs: 10,
        sugars: 5,
        image: 'https://unsplash.com/photos/brown-fried-food-on-white-ceramic-plate-PwjaasXRuk4',
      ),
      Meals(
        name: 'Nasi Padang',
        calories: 280,
        fat: 18,
        proteins: 20,
        carbs: 30,
        sugars: 8,
        image: 'https://assets-pergikuliner.com/4o-dKncqKNS6QQbFDqM52WkrK0o=/fit-in/1366x768/smart/filters:no_upscale()/https://assets-pergikuliner.com/uploads/bootsy/image/12013/picture-1537766225.jpeg',
      ),
      Meals(
        name: 'Bakso',
        calories: 200,
        fat: 12,
        proteins: 18,
        carbs: 15,
        sugars: 3,
        image: 'https://th.bing.com/th/id/R.e58cb6f3b565c105cad9366e597a587f?rik=sEWN%2fFJfyvgQYA&riu=http%3a%2f%2farieskitchen.net%2fwp-content%2fuploads%2f2014%2f04%2fIMG_0414.jpg&ehk=vnmLVw5SrqaNOfkvTp3CWIqnDHHOP7ErkXe7vMsp6Ps%3d&risl=&pid=ImgRaw&r=0',
      ),
    ];

    await _analyzeService.add(meals);
  }
}

final analyzeControllerProvider =
    StateNotifierProvider<AnalyzeController, AnalyzeState>((ref) {
  final analyzeService = ref.read(analyzeServiceProvider);
  return AnalyzeController(analyzeService);
});
