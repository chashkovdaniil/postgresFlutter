import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:postgresUn/modules/users/data/user_datasource.dart';
import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class UserLocalDatasource implements UserDatasource {
  final PostgresService _postgresService;
  UserLocalDatasource({
    required PostgresService postgresService,
  }) : _postgresService = postgresService;
  @override
  Future<User> create(RegisterUser registerUser) async {
    await _postgresService.execute(
      'INSERT INTO users '
      '(name, last_name, patronymic, birthdate, email, phone, permission, photo, password) '
      'VALUES (@name, @last_name, @patronymic, @birthdate, @email, @phone, @permission, @photo, @password)',
      values: {
        'name': registerUser.name,
        'last_name': registerUser.lastName,
        'patronymic': registerUser.patronymic,
        'birthdate': registerUser.birthdate,
        'email': registerUser.email,
        'phone': registerUser.phone,
        'permission': registerUser.permission,
        'password': registerUser.password,
        'photo': registerUser.photo.path,
      },
    );
    final response = await _postgresService.mappedResultsQuery(
      'SELECT * FROM users WHERE email = @email',
      values: {'email': registerUser.email},
    );
    final user = response[0]['users'];
    if (user == null) {
      throw Exception('User doesn\'t create');
    }
    return User.fromJson(user);
  }

  @override
  Future<void> delete(User user) async {
    await _postgresService.execute(
      'DELETE FROM users WHERE id = @id',
      values: {'email': user.id},
    );
  }

  @override
  Future<void> update(User user) async {
    await _postgresService.execute(
      'UPDATE users SET'
      'name = @name, last_name = @last_name, patronymic = @patronymic,'
      'birthdate = @birthdate, email = @email, phone = @phone,'
      'permission = @permission, photo = @photo, password = @password) '
      'WHERE id = @id',
      values: {
        'id': user.id,
        'name': user.name,
        'last_name': user.lastName,
        'patronymic': user.patronymic,
        'birthdate': user.birthdate,
        'email': user.email,
        'phone': user.phone,
        'permission': user.permission,
        'password': user.password,
        'photo': user.photo,
      },
    );
  }

  @override
  Future<User> user(int id) async {
    const query = 'SELECT * FROM users WHERE id = @id';
    final result = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'id': id,
      },
    );
    if (result.isEmpty || result[0]['users'] == null) {
      throw Exception('User not found');
    }
    return User.fromJson(result[0]['users']!);
  }

  @override
  Future<User> userByEmail(String email) async {
    const query = 'SELECT * FROM users WHERE email = @email';
    final result = await _postgresService.mappedResultsQuery(
      query,
      values: {
        'email': email,
      },
    );
    if (result.isEmpty || result[0]['users'] == null) {
      throw Exception('User not found');
    }
    return User.fromJson(result[0]['users']!);
  }
}
