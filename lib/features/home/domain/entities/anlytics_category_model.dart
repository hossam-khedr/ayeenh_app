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
      ],
          description: 'ساعد التحاليل الشاملة على الكشف المبكر عن الأمراض وعلاجها على الفور، ومنع حدوث الكثير من المضاعفات التي قد تُسببها، والجيد أنّ هذه التحاليل بسيطة ولا تتطلب إجراءات معقدة أهم التحاليل الشاملة للاطمئنان على صحتك تشمل التحاليل الطبية الشاملة عددًا كبيرًا من الفحوصات، منها ما يتطلب سحب عينة من الدم أو أخذ عينة من البول، وعند تحليل هذه العينات يمكن معرفة الكثير عن صحة الجسم وسلامته وسنذكر فيما يأتي أهمّ التحاليل الشاملة التي عادة ما يطلبها الطبيب للاطمئنان على الصحة تحليل صورة الدم الكاملة (Complete blood count) '),
    ),
    AnalysisCategoryModel(
      'تحاليل مرض السكر',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'دهنيات الدم',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل وظائف الكبد',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل سيولة الدم',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل امراض الدم',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل الهرمونات',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل الباثونجي',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل التورش (للسيدات)',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل قياس الادويه العلاجيه',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل الوراثه',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل المزارع',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل الامراض المعديه',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل مرد الدرن',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل الامراض المناعيه',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل الحساسيه',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل دلالات الاورام من الدم',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل اكتشاف الطفل المنجولي',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل قبل الزواج',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
    AnalysisCategoryModel(
      'تحاليل كتشاف فرص تكون الجلطات في الدم',
      '',
      CategoryDetails(price: '500', analysisType: [], description: ''),
    ),
  ];
}

class CategoryDetails {
  String price;
  String description;
  List<String> analysisType;

  CategoryDetails(
      {required this.price,
      required this.analysisType,
      required this.description});
}
