import 'package:ayeenh/features/auth/auth_di.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/home_di.dart';
import '../../features/user_request/user_request_di.dart';

//final sl = GetIt.instance;
class InjectionContainer{
Future<void> initSl()async {
  initAuthModule();
  initHomeModule();
  initUserRequestModule();
}
}