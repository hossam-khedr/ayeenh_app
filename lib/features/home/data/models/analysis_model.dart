class AnalysisModel{
  String name;
  String analysisCount;
  String analysisPrise;
  AnalysisModel({ required this.name,required this.analysisCount,required this.analysisPrise});

  factory AnalysisModel.fromJson(Map<String,dynamic>json){
    return AnalysisModel(
      name:json['name'],
      analysisCount:json['analysis_count'],
      analysisPrise:json['analysis_prise'],
    );
  }

}