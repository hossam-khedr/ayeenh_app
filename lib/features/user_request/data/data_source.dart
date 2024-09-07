

import 'models/user_request_model.dart';

abstract class RequestDataSource{
  Future<dynamic>sendUserRequest(UserRequestModel model);
}