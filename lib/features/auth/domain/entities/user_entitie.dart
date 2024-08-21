import 'package:ayeenh/features/auth/data/models/user_model.dart';

class UserEntity extends UserModel {
  UserEntity(
      {required super.name,
      required super.phone,
      required super.address,
      required super.age,
      required super.email});
}
