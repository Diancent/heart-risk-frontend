import 'package:flutter/material.dart';
import '../heart_risk_model.dart';

class HeartRiskProvider with ChangeNotifier {
  HeartRiskModel _data = HeartRiskModel();

  HeartRiskModel get data => _data;

  void updateAge(int age) {
    _data.age = age;
    notifyListeners();
  }

  void updateGender(String gender) {
    _data.gender = gender;
    notifyListeners();
  }

  void updateHeight(int height) {
    _data.height = height;
    notifyListeners();
  }

  void updateWeight(int weight) {
    _data.weight = weight;
    notifyListeners();
  }

  void updateEthnicity(String ethnicity) {
    _data.ethnicity = ethnicity;
    notifyListeners();
  }

  void updateAddress(String address) {
    _data.address = address;
    notifyListeners();
  }

  void updateSmokingStatus(bool smokes) {
    _data.smokes = smokes;
    notifyListeners();
  }

  void updateBloodPressure(String? pressure) {
    _data.bloodPressure = pressure;
    notifyListeners();
  }

  void updateHighCholesterol(bool value) {
    _data.highCholesterol = value;
    notifyListeners();
  }

  void updateHealthConditions(List<String> conditions) {
    _data.healthConditions = conditions;
    notifyListeners();
  }
}
