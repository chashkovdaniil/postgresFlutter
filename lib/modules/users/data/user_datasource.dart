import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

abstract class UserDatasource {
  Future<User> create(RegisterUser user);
  Future<User> user(int id);
  Future<List<User>> users();
  Future<User> userByEmail(String email);
  Future<void> update(User user);
  Future<void> delete(User user);
}
