class UserClasses{
  final String className;
  double grade = 0.0; 

  double weight1;
  double weight1Value;
  double weight2;
  double weight2Value;
  double weight3;
  double weight3Value;
  double weight4;
  double weight4Value;
  double weight5;
  double weight5Value;
  double weight6;
  double weight6Value;
  double weight7;
  double weight7Value;

  UserClasses({this.className, this.grade, this.weight1, this.weight1Value, this.weight2, this.weight2Value, this.weight3, this.weight3Value, this.weight4, this.weight4Value, this.weight5, this.weight5Value, this.weight6, this.weight6Value, this.weight7, this.weight7Value});

  Map<String, dynamic> toMap(){
    return{
      'class_name' : className,
      'grade' : grade,
      'weight1' : weight1,
      'weight1_value': weight1Value,
      "weight2" : weight2,
      "weight2_value": weight2Value,
      "weight3": weight3,
      "weight3_value" : weight3Value,
      "weight4": weight4,
      "weight4_value" : weight4Value,
      "weight5" : weight5,
      "weight5_value" : weight5Value,
      "weight6" : weight6,
      "weight6_value" : weight6Value,
      "weight7" : weight7,
      "weight7_value" : weight7Value,
    };
  }

}