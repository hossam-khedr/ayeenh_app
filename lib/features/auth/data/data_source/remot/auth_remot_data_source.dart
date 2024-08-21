import 'package:ayeenh/features/auth/data/data_source/data_source.dart';
import 'package:ayeenh/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource implements AuthDataSource{
  final auth = FirebaseAuth.instance;
  final dataBase = FirebaseFirestore.instance;
  @override
  Future<void> register(String email, String password)async {
  await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> login(String email, String password) async{
   await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> saveUser(UserModel userModel)async {
   dataBase.collection('users').add(userModel.toJson());
  }

}