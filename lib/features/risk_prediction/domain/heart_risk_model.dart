class HeartRiskModel {
  int age;
  String gender;
  int height;
  int weight;
  String ethnicity;
  String address;
  bool smokes;
  String? bloodPressure;
  bool highCholesterol;
  List<String> healthConditions;

  HeartRiskModel({
    this.age = 0,
    this.gender = '',
    this.height = 0,
    this.weight = 0,
    this.ethnicity = '',
    this.address = '',
    this.smokes = false,
    this.bloodPressure,
    this.highCholesterol = false,
    this.healthConditions = const [],
  });
}
