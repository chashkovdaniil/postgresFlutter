import 'package:postgresUn/modules/users/data/user_datasource.dart';
import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';
import 'package:postgresUn/modules/users/domain/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource _localDatasource;
  UserRepositoryImpl({
    required UserDatasource localDatasource,
  }) : _localDatasource = localDatasource;

  @override
  Future<User> create(RegisterUser user) {
    return _localDatasource.create(user);
  }

  @override
  Future<void> delete(User user) {
    return _localDatasource.delete(user);
  }

  @override
  Future<void> update(User user) {
    return _localDatasource.update(user);
  }

  @override
  Future<User> user(int id) {
    return _localDatasource.user(id);
  }

  @override
  Future<User> userByEmail(String email) {
    return _localDatasource.userByEmail(email);
  }
}
