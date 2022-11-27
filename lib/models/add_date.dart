import 'package:hive/hive.dart';
part 'add_date.g.dart';

@HiveType(typeId: 1)
// ignore: camel_case_types
class Add_data extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String iN;
  @HiveField(4)
  DateTime datetime;
  Add_data(this.iN, this.amount, this.datetime, this.explain, this.name);
}
