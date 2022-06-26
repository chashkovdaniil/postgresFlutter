import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:objectdb/src/objectdb_storage_filesystem.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class LocalDB {
  User? _user;
  final path = Directory.current.path + '/my.db';
  late final db = ObjectDB(FileSystemStorage(path));

  Future<bool> isLogged() async {
    try {
      if (_user == null) {
        final result = await db.first();
        _user = User.fromJson(result as Map<String, dynamic>);
      }
      return true;
    } catch (err) {
      return false;
    }
  }

  User? get user => _user;

  Future<void> saveUser(User user) async {
    if (_user == null) {
      _user = user;
      await db.insert(_user!.toJson());
    }
  }

  Future<void> removeUser() async {
    if (_user != null) {
      await db.remove(_user!.toJson());
    }
  }
}
