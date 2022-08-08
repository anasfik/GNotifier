import 'package:hive_flutter/hive_flutter.dart';

part 'newItemNotificationModel.g.dart';
@HiveType(typeId: 0)
class NewItemNotifcationModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  DateTime dateToShow;
  @HiveField(3)
  bool isIntervaled;
  @HiveField(4)
  double intervalDuration;

  NewItemNotifcationModel(this.title, this.description, this.dateToShow,
      this.isIntervaled, this.intervalDuration);
}
