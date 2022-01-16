import 'package:flutter_test/flutter_test.dart';
import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:postgresUn/modules/users/data/user_datasource.dart';
import 'package:postgresUn/modules/users/data/user_local_datasource.dart';
import 'package:postgresUn/modules/users/data/user_repository_impl.dart';
import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
import 'package:postgresUn/modules/users/domain/user_repository.dart';

void main() {
  final UserDatasource userDatasource = UserLocalDatasource(
    postgresService: PostgresService()..init(),
  );
  final UserRepository userRepository = UserRepositoryImpl(
    localDatasource: userDatasource,
  );
  test('Register & delete user', () async {
    try {
      final res = await userRepository.create(
        RegisterUser(
          name: 'name',
          lastName: 'lastName',
          patronymic: 'patronymic',
          email: 'email@emaik.com',
          phone: 9999999,
          photo: 'photo',
          permission: 'permission',
          password: 'password',
          birthdate: DateTime.now(),
        ),
      );
      await userRepository.delete(res);
      expect(true, true);
    } catch (err) {
      expect(true, false);
    }
  });
}
