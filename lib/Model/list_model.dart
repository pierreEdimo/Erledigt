import 'package:hive/hive.dart';

part 'list_model.g.dart';

@HiveType(typeId: 0)
class ListModel extends HiveObject {
  @HiveField(0)
  late String? name;

  @HiveField(2)
  late String? description;

  ListModel({
    this.name,
    this.description,
  });
}
