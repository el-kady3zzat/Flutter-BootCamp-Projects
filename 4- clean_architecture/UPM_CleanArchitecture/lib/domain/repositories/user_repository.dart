import 'package:user_profile_management/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
