import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseCollections {
  static final analysisCategoryCollection =
      FirebaseFirestore.instance.collection('analysis_category');
  static final userRequestCollection =
  FirebaseFirestore.instance.collection('user_requestes');
}
