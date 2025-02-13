import 'package:user_profile_management/domain/entities/user.dart';
import 'package:user_profile_management/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repo;

  GetUsersUseCase(this.repo);

  Future<List<User>> execute() async {
    return await repo.getUsers();
  }
}
