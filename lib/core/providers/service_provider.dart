import 'package:postgresUn/core/services/postgres_service.dart';
import 'package:riverpod/riverpod.dart';

class ServiceProvider {
  static Provider<PostgresService> postgres = Provider(
    (ref) => PostgresService()..init(),
  );
}
