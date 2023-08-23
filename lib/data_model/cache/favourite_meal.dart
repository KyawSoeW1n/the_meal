import 'package:hive/hive.dart';

part 'favourite_meal.g.dart';

@HiveType(typeId: 1)
class CacheMeal extends HiveObject {
  @HiveField(0)
  final int mealId;

  @HiveField(1)
  final String mealName;

  @HiveField(2)
  final String mealCategory;

  @HiveField(3)
  final String mealArea;
  @HiveField(4)
  final String mealInstruction;
  @HiveField(5)
  final String mealImage;
  @HiveField(6)
  final String youtubeLink;
  @HiveField(7)
  final String ingredient;
  @HiveField(8)
  bool isFavourite;

  CacheMeal(
    this.mealId,
    this.mealName,
    this.mealCategory,
    this.mealArea,
    this.mealInstruction,
    this.mealImage,
    this.youtubeLink,
    this.ingredient,
    this.isFavourite,
  );
}
