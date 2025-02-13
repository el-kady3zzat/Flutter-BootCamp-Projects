import 'package:dio/dio.dart';
import 'package:user_profile_management/data/models/api_user_model.dart';

class UserRemoteDataSource {
  final Dio dio;
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  UserRemoteDataSource({required this.dio});

  Future<List<ApiUserModel>> getUsers() async {
    try {
      Response response = await dio.get('$baseUrl/users');
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => ApiUserModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createUser(ApiUserModel user) async {
    try {
      await dio.post('/users', data: user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateUser(ApiUserModel user) async {
    try {
      await dio.put('/users/${user.id}', data: user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await dio.delete('/users/$id');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
