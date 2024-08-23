class AnalysisCategoryModel{
  String title;
  String? icon;
  AnalysisCategoryModel(this.title,this.icon);

  static List<AnalysisCategoryModel> analysisCategory = [
    AnalysisCategoryModel('مجموعه من التحاليل يتم عملها شهريا', ''),
    AnalysisCategoryModel('تحاليل مرض السكر', ''),
    AnalysisCategoryModel('دهنيات الدم', ''),
    AnalysisCategoryModel('تحاليل وظائف الكبد', ''),
    AnalysisCategoryModel('تحاليل سيولة الدم', ''),
    AnalysisCategoryModel('تحاليل امراض الدم', ''),
    AnalysisCategoryModel('تحاليل الهرمونات', ''),
    AnalysisCategoryModel('تحاليل الباثونجي', ''),
    AnalysisCategoryModel('تحاليل التورش (للسيدات)', ''),
    AnalysisCategoryModel('تحاليل قياس الادويه العلاجيه', ''),
    AnalysisCategoryModel('تحاليل الوراثه', ''),
    AnalysisCategoryModel('تحاليل المزارع', ''),
    AnalysisCategoryModel('تحاليل الامراض المعديه', ''),
    AnalysisCategoryModel('تحاليل مرد الدرن', ''),
    AnalysisCategoryModel('تحاليل الامراض المناعيه', ''),
    AnalysisCategoryModel('تحاليل الحساسيه', ''),
    AnalysisCategoryModel('تحاليل دلالات الاورام من الدم', ''),
    AnalysisCategoryModel('تحاليل اكتشاف الطفل المنجولي', ''),
    AnalysisCategoryModel('تحاليل قبل الزواج', ''),
    AnalysisCategoryModel('تحاليل كتشاف فرص تكون الجلطات في الدم', ''),
  ];
}