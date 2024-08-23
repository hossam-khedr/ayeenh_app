class AnalysisCategoryModel {
  String title;
  CategoryDetails categoryDetails;
  String? icon;

  AnalysisCategoryModel(this.title, this.icon, this.categoryDetails);

  static List<AnalysisCategoryModel> analysisCategory = [
    AnalysisCategoryModel(
      'مجموعه من التحاليل يتم عملها شهريا',
      '',
      CategoryDetails(price: '500', analysisType: [
        'وظائف الكبد',
        'وظائف الكلي',
        'صورة دم',
        'سكر صاتم',
        'سرعة ترسيب',
        'املاح النقرس',
        'تحليل بول',
        'دهنيات الدم كامله',
      ]),
    ),
    AnalysisCategoryModel(
      'تحاليل مرض السكر',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'دهنيات الدم',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل وظائف الكبد',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل سيولة الدم',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل امراض الدم',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل الهرمونات',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل الباثونجي',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل التورش (للسيدات)',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل قياس الادويه العلاجيه',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل الوراثه',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل المزارع',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل الامراض المعديه',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل مرد الدرن',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل الامراض المناعيه',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل الحساسيه',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل دلالات الاورام من الدم',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل اكتشاف الطفل المنجولي',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل قبل الزواج',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
    AnalysisCategoryModel(
      'تحاليل كتشاف فرص تكون الجلطات في الدم',
      '',
      CategoryDetails(price: '500', analysisType: []),
    ),
  ];
}

class CategoryDetails {
  String price;
  List<String> analysisType;

  CategoryDetails({required this.price, required this.analysisType});
}
