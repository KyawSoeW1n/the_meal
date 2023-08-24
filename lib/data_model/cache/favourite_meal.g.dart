// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheMealAdapter extends TypeAdapter<CacheMeal> {
  @override
  final int typeId = 1;

  @override
  CacheMeal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheMeal(
      mealId: fields[0] as String,
      mealName: fields[1] as String,
      mealCategory: fields[2] as String,
      mealArea: fields[3] as String,
      mealInstruction: fields[4] as String,
      mealImage: fields[5] as String,
      youtubeLink: fields[6] as String,
      ingredient: fields[7] as String,
      isFavourite: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CacheMeal obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.mealId)
      ..writeByte(1)
      ..write(obj.mealName)
      ..writeByte(2)
      ..write(obj.mealCategory)
      ..writeByte(3)
      ..write(obj.mealArea)
      ..writeByte(4)
      ..write(obj.mealInstruction)
      ..writeByte(5)
      ..write(obj.mealImage)
      ..writeByte(6)
      ..write(obj.youtubeLink)
      ..writeByte(7)
      ..write(obj.ingredient)
      ..writeByte(8)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheMealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
