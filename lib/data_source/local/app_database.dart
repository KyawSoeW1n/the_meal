import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_testing/app_constants/db_constants.dart';
import 'package:riverpod_testing/core/enum_collection/theme_type.dart';
import 'package:riverpod_testing/core/locale/support_locale.dart';
import 'package:riverpod_testing/data_model/cache/favourite_meal.dart';
import 'package:rxdart/rxdart.dart';

final databaseService = Provider<DatabaseService>((_) => DatabaseService());

final postsStreamProvider = StreamProvider.autoDispose((ref) async* {
  yield* ref.watch(databaseService).getPostStream();
});

final favouritePostsStreamProvider = StreamProvider.autoDispose((ref) async* {
  yield* ref.watch(databaseService).getFavouritePostStream();
});

final favouritePostListStream = StreamProvider.autoDispose((ref) async* {
  yield* ref.watch(databaseService).getFavouritePostListStream();
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

  Future<void> initPostBox() async {
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

  Stream<List<CacheMeal>> getPostStream() {
    return _favouriteMealBox
        .watch()
        .map((event) => getPostList())
        .startWith(getPostList());
  }

  Stream<int> getFavouritePostStream() {
    return _favouriteMealBox
        .watch()
        .map((event) => getFavouritePostCount())
        .startWith(getFavouritePostCount());
  }

  Stream<List<CacheMeal>> getFavouritePostListStream() {
    return _favouriteMealBox
        .watch()
        .map((event) => getFavouritePostList())
        .startWith(getFavouritePostList());
  }

  List<CacheMeal> getPostList() {
    return List<CacheMeal>.from(_favouriteMealBox.values);
  }

  Locale getLanguage() {
    return Locale(_languageBox.getAt(0) ?? SupportedLocale.en.languageCode);
  }

  List<CacheMeal> getFavouritePostList() {
    final favouriteList = List<CacheMeal>.from(_favouriteMealBox.values)
        .where((element) => element.isFavourite)
        .toList();
    return favouriteList;
  }

  int getFavouritePostCount() {
    final favouritePostList = List<CacheMeal>.from(_favouriteMealBox.values)
        .where((element) => element.isFavourite)
        .toList();
    return favouritePostList.length;
  }
}
