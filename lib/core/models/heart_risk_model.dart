class HeartRiskModel {
  int age;
  int gender; // 1 для чоловіків, 0 для жінок
  int height; // у сантиметрах
  int weight; // у кілограмах
  int isSmoke; // 1 якщо курить, 0 якщо ні
  int isAlco; // 1 якщо вживає алкоголь, 0 якщо ні
  int isActive; // 1 якщо активний (спорт), 0 якщо ні
  int gluc; // Рівень глюкози
  int cholesterol; // Рівень холестерину
  int apHi; // Систолічний артеріальний тиск
  int apLo; // Діастолічний артеріальний тиск

  HeartRiskModel({
    this.age = 0,
    this.gender = 0,
    this.height = 0,
    this.weight = 0,
    this.isSmoke = 0,
    this.isAlco = 0,
    this.isActive = 0,
    this.gluc = 0,
    this.cholesterol = 0,
    this.apHi = 0,
    this.apLo = 0,
  });

  // Convert JSON to object
  factory HeartRiskModel.fromJson(Map<String, dynamic> json) {
    return HeartRiskModel(
      age: json['age'] ?? 0,
      gender: json['gender'] ?? 0,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      isSmoke: json['is_smoke'] ?? 0,
      isAlco: json['is_alco'] ?? 0,
      isActive: json['is_active'] ?? 0,
      gluc: json['gluc'] ?? 0,
      cholesterol: json['cholesterol'] ?? 0,
      apHi: json['ap_hi'] ?? 0,
      apLo: json['ap_lo'] ?? 0,
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'is_smoke': isSmoke,
      'is_alco': isAlco,
      'is_active': isActive,
      'gluc': gluc,
      'cholesterol': cholesterol,
      'ap_hi': apHi,
      'ap_lo': apLo,
    };
  }
}
