import 'package:user_profile_management/data/datasources/user_remote_data_source.dart';
import 'package:user_profile_management/data/models/api_user_model.dart';
import 'package:user_profile_management/domain/entities/user.dart';
import 'package:user_profile_management/domain/repositories/user_repository.dart';

// This repository acts as a bridge between the domain layer and the data layer.
// It ensures that the domain layer doesn’t directly deal with APIs or databases.
// And only interacts with repositories and doesn’t know about the data source details.

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> getUsers() async {
    // Call the remote data source (UserRemoteDataSource) to fetch the data.
    final List<ApiUserModel> apiModels = await remoteDataSource.getUsers();

    // Convert the raw data models (ApiUserModel) into domain entities (User) before returning them.
    return apiModels.map(_convertToDomainEntity).toList();
  }

  User _convertToDomainEntity(ApiUserModel model) {
    return User(
      id: model.id,
      name: model.name,
      username: model.username,
      email: model.email,
      address: _convertAddress(model.address),
      phone: model.phone,
      website: model.website,
      company: _convertCompany(model.company),
    );
  }

  Address _convertAddress(Address modelAddress) {
    return Address(
      street: modelAddress.street,
      suite: modelAddress.suite,
      city: modelAddress.city,
      zipcode: modelAddress.zipcode,
      geo: _convertGeo(modelAddress.geo),
    );
  }

  Geo _convertGeo(Geo modelGeo) {
    return Geo(
      lat: modelGeo.lat,
      lng: modelGeo.lng,
    );
  }

  Company _convertCompany(Company modelCompany) {
    return Company(
      name: modelCompany.name,
      catchPhrase: modelCompany.catchPhrase,
      bs: modelCompany.bs,
    );
  }
}
