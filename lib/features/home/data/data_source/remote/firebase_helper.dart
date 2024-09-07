import 'package:ayeenh/core/utilities/firebase_collections.dart';
import 'package:ayeenh/features/home/data/data_source/data_source.dart';
import 'package:ayeenh/features/home/data/models/analysis_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseHelper implements HomeDataSource {
  @override
  Future<List<AnalysisModel>> getAllAnalysis() async {
    debugPrint('START: getAllAnalysis');
    CollectionReference analysis =
        FirebaseCollections.analysisCategoryCollection;
    QuerySnapshot querySnapshot = await analysis.get();
    final allAnalysis = querySnapshot.docs.map((model) {
      Map<String, dynamic> analysisModel = model.data() as Map<String, dynamic>;
      return AnalysisModel.fromJson(analysisModel);
    }).toList();
    debugPrint(allAnalysis.toString());
    debugPrint('END: getAllAnalysis');
    return allAnalysis;
  }
}
