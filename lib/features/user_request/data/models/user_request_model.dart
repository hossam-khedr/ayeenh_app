class UserRequestModel {
  String userName;
  String analysisType;
  String dateTime;
  String address;
  bool isStatus;

  UserRequestModel({
    required this.userName,
    required this.analysisType,
    required this.dateTime,
    required this.isStatus,
    required this.address
  });

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRequestModel(
      userName: json['name'],
      analysisType: json['analysisType'],
      address: json['address'],
      dateTime: json['dateTime'],
      isStatus: json['isStatus'],
    );
  }

  Map<String,dynamic>toJson()=>{
    'name':userName,
    'analysisType':analysisType,
    'address':address,
    'dateTime':dateTime,
    'isStatus':isStatus

  };
}
