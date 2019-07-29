import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// return the path
Future<String> initDeleteDb(String dbName) async {
  final String databasePath = await getDatabasesPath();
  // print(databasePath);
  final String path = join(databasePath, dbName);

  // make sure the folder exists
  if (await Directory(dirname(path)).exists()) {
    ///如果已经存在删除
    await deleteDatabase(path);
  } else {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      print(e);
    }
  }
  return path;
}
