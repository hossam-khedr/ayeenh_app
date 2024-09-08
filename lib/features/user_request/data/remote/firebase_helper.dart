import 'package:ayeenh/features/home/domain/entities/request_model.dart';
import 'package:ayeenh/features/user_request/data/data_source.dart';
import 'package:ayeenh/features/user_request/data/models/user_request_model.dart';

import '../../../../core/utilities/firebase_collections.dart';

class FirebaseHelperUserRequest implements RequestDataSource{
  @override
  Future<void> sendUserRequest(UserRequestModel model)async {
   await FirebaseCollections.userRequestCollection.add(model.toJson());
  }

}