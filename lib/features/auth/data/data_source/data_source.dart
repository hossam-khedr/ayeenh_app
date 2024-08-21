import 'package:ayeenh/features/auth/data/models/user_model.dart';

abstract class AuthDataSource{
  Future<dynamic>register(String email,String password);
  Future<dynamic>login(String email,String password);
  Future<dynamic>saveUser(UserModel userModel);
}