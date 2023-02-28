import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 0)
class Exercise extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int reps;

  @HiveField(2)
  int sets;

  Exercise(this.name, this.reps, this.sets);
}
