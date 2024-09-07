

class RequestModel {
  String name;
  String analysisType;
  String dateTime;
  bool isStatus;

  RequestModel(
      {required this.name,
        required this.analysisType,
        required this.dateTime,
        required this.isStatus,});

  static List<RequestModel> getRequests = [
    RequestModel(
      name: 'احمد السسيد علي',
      analysisType: 'مجموعه من التحاليل يتم عملها شهريا',
      dateTime: '5/9/2024',
      isStatus: false,
    ),
    RequestModel(
      name: 'اابراهيم محمود الشرقاوي',
      analysisType: 'دهنيات الدم',
      dateTime: '5/6/2024',
      isStatus: true,
    ),
    RequestModel(
      name: 'مصطفي السيد ابراهيم',
      analysisType: 'تحاليل امراض الدم',
      dateTime: '5/5/2024',
      isStatus: true,
    ),
    RequestModel(
      name: 'علي احمد علي',
      analysisType: 'تحاليل قياس الادويه العلاجيه',
      dateTime: '5/10/2024',
      isStatus: false,
    ),
    RequestModel(
      name: 'ناديه صبحي السيد',
      analysisType: 'تحاليل الوراثه',
      dateTime: '5/3/2024',
      isStatus: true,
    ),
  ];
}
