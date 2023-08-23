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
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as bool,
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
