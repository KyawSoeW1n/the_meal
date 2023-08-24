import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_meal/app_constants/db_constants.dart';
import 'package:the_meal/core/enum_collection/theme_type.dart';
import 'package:the_meal/core/locale/support_locale.dart';
import 'package:the_meal/data_model/cache/favourite_meal.dart';

import '../../features/meals/notifier/selected_meal_categories_notifier.dart';

final databaseService = Provider<DatabaseService>((_) => DatabaseService());

final mealListStreamProvider = StreamProvider.autoDispose((ref) async* {
  final mealCategory = ref.watch(selectedMealCategoryNotifierProvider);
  yield* ref
      .watch(databaseService)
      .getMealStream(mealCategory.data?.name ?? "");
});

final favouritePostListStream = StreamProvider.autoDispose((ref) async* {
  yield* ref.watch(databaseService).getFavouriteMealListStream();
});

class DatabaseService {
  late final Box<String> _themeBox;
  late final Box<CacheMeal> _favouriteMealBox;
  late final Box<String> _languageBox;
  late final Box<String> _userDataBox;

  String get savedTheme => _themeBox.values.first;

  Future<void> initTheme() async {
    await Hive.openBox<String>(DBConstants.themeBox)
        .then((value) => _themeBox = value);

    if (_themeBox.values.isEmpty) {
      _themeBox.add(ThemeType.light.name);
    }
  }

  Future<void> initLanguageBox() async {
    await Hive.openBox<String>(DBConstants.languageBox)
        .then((value) => _languageBox = value);

    if (_languageBox.values.isEmpty) {
      _languageBox.add(
        SupportedLocale.en.languageCode,
      );
    }
  }

  Future<void> initUserDataBox() async {
    await Hive.openBox<String>(DBConstants.userBox)
        .then((value) => _userDataBox = value);

    if (_userDataBox.values.isEmpty) {
      _userDataBox.add("");
    }
  }

  Future<void> initMealBox() async {
    await Hive.openBox<CacheMeal>(DBConstants.postBox)
        .then((value) => _favouriteMealBox = value);
  }

  Future<void> toggleSaveTheme(String mode) async =>
      await _themeBox.put(0, mode);

  Future<void> saveLanguage(SupportedLocale locale) async =>
      await _languageBox.put(0, locale.languageCode);

  Future<void> saveUserDataBox(String userData) async =>
      await _userDataBox.put(0, userData);

  String getUserBox() => _userDataBox.getAt(0) ?? "";

  Future<void> changePostStatus(CacheMeal cacheMeal) async {
    cacheMeal.isFavourite = !cacheMeal.isFavourite;
    cacheMeal.save();
  }

  Future<void> insertPostList(List<CacheMeal> postList) async {
    for (var newData in postList) {
      // Check if the data already exists in the box
      int existingIndex = _favouriteMealBox.values
          .cast<CacheMeal>()
          .toList()
          .indexWhere((item) => item.mealId == newData.mealId);

      if (existingIndex != -1) {
        // Update existing data
        _favouriteMealBox.putAt(existingIndex, newData);
      } else {
        // Add new data
        _favouriteMealBox.add(newData);
      }
    }
  }

  Stream<List<CacheMeal>> getMealStream(String categoryName) {
    return _favouriteMealBox
        .watch()
        .map((event) => getMealList(categoryName))
        .startWith(getMealList(categoryName));
  }

  Stream<List<CacheMeal>> getFavouriteMealListStream() {
    return _favouriteMealBox
        .watch()
        .map((event) => getFavouriteMealList())
        .startWith(getFavouriteMealList());
  }

  List<CacheMeal> getMealList(String categoryName) {
    final favouriteList = List<CacheMeal>.from(_favouriteMealBox.values)
        .where((element) => element.mealCategory == categoryName)
        .toList();
    return favouriteList;
  }

  Locale getLanguage() {
    return Locale(_languageBox.getAt(0) ?? SupportedLocale.en.languageCode);
  }

  List<CacheMeal> getFavouriteMealList() {
    final favouriteList = List<CacheMeal>.from(_favouriteMealBox.values)
        .where((element) => element.isFavourite)
        .toList();
    return favouriteList;
  }
}
