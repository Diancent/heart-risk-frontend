import 'package:flutter/material.dart';
import '../../../../core/models/heart_risk_model.dart';

class HeartRiskProvider with ChangeNotifier {
  HeartRiskModel _data = HeartRiskModel();

  HeartRiskModel get data => _data;

  // Оновлюємо окремі поля
  void updateAge(int age) {
    if (_data.age != age) {
      _data.age = age;
      notifyListeners();
    }
  }

  void updateHeight(int height) {
    if (_data.height != height) {
      _data.height = height;
      notifyListeners();
    }
  }

  void updateGender(int gender) {
    if (_data.gender != gender) {
      _data.gender = gender;
      notifyListeners();
    }
  }

  void updateWeight(int weight) {
    if (_data.weight != weight) {
      _data.weight = weight;
      notifyListeners();
    }
  }

  void updateSmokingStatus(int isSmoke) {
    if (_data.isSmoke != isSmoke) {
      _data.isSmoke = isSmoke;
      notifyListeners();
    }
  }

  void updateAlcoholStatus(int isAlco) {
    if (_data.isAlco != isAlco) {
      _data.isAlco = isAlco;
      notifyListeners();
    }
  }

  void updateActivityStatus(int isActive) {
    if (_data.isActive != isActive) {
      _data.isActive = isActive;
      notifyListeners();
    }
  }

  void updateGlucoseLevel(int gluc) {
    if (_data.gluc != gluc) {
      _data.gluc = gluc;
      notifyListeners();
    }
  }

  void updateCholesterolLevel(int cholesterol) {
    if (_data.cholesterol != cholesterol) {
      _data.cholesterol = cholesterol;
      notifyListeners();
    }
  }

  void updateBloodPressure({required int apHi, required int apLo}) {
    if (_data.apHi != apHi || _data.apLo != apLo) {
      _data.apHi = apHi;
      _data.apLo = apLo;
      notifyListeners();
    }
  }

  // Оновлення рівня глюкози
  void updateGluc(int gluc) {
    if (_data.gluc != gluc) {
      _data.gluc = gluc;
      notifyListeners();
    }
  }

  // Оновлення рівня холестерину
  void updateCholesterol(int cholesterol) {
    if (_data.cholesterol != cholesterol) {
      _data.cholesterol = cholesterol;
      notifyListeners();
    }
  }

  // Оновлення систолічного артеріального тиску
  void updateApHi(int apHi) {
    if (_data.apHi != apHi) {
      _data.apHi = apHi;
      notifyListeners();
    }
  }

  // Оновлення діастолічного артеріального тиску
  void updateApLo(int apLo) {
    if (_data.apLo != apLo) {
      _data.apLo = apLo;
      notifyListeners();
    }
  }

  // Оновлюємо дані за один раз
  void updateData({
    int? age,
    int? gender,
    int? height,
    int? weight,
    int? isSmoke,
    int? isAlco,
    int? isActive,
    int? gluc,
    int? cholesterol,
    int? apHi,
    int? apLo,
  }) {
    if (age != null && _data.age != age) _data.age = age;
    if (gender != null && _data.gender != gender) _data.gender = gender;
    if (height != null && _data.height != height) _data.height = height;
    if (weight != null && _data.weight != weight) _data.weight = weight;
    if (isSmoke != null && _data.isSmoke != isSmoke) _data.isSmoke = isSmoke;
    if (isAlco != null && _data.isAlco != isAlco) _data.isAlco = isAlco;
    if (isActive != null && _data.isActive != isActive)
      _data.isActive = isActive;
    if (gluc != null && _data.gluc != gluc) _data.gluc = gluc;
    if (cholesterol != null && _data.cholesterol != cholesterol)
      _data.cholesterol = cholesterol;
    if (apHi != null && _data.apHi != apHi) _data.apHi = apHi;
    if (apLo != null && _data.apLo != apLo) _data.apLo = apLo;

    // Debug print
    print("Updated HeartRiskModel: ");
    print("Age: ${_data.age}");
    print("Gender: ${_data.gender}");
    print("Height: ${_data.height}");
    print("Weight: ${_data.weight}");
    print("Is Smoke: ${_data.isSmoke}");
    print("Is Alcohol: ${_data.isAlco}");
    print("Is Active: ${_data.isActive}");
    print("Glucose Level: ${_data.gluc}");
    print("Cholesterol Level: ${_data.cholesterol}");
    print("Systolic Pressure: ${_data.apHi}");
    print("Diastolic Pressure: ${_data.apLo}");

    notifyListeners();
  }
}
