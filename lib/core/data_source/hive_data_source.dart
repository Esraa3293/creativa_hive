import 'package:hive_flutter/hive_flutter.dart';

class HiveDataSource {
  final Box box = Hive.box("name");

  Future<void> createName(String newName) async {
    await box.put("name", newName);
  }

  Future<void> deleteName() async {
    await box.delete("name");
  }

  String getName() {
    return box.get("name");
  }

}
