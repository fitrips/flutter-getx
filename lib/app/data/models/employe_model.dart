class Employee {
  int id;
  String? employeName;
  String? employeRole;
  String? employePhoneNumber;
  String? employeAddress;
  String? createdAt;
  String? updatedAt;

  Employee({
    required this.id,
    this.employeName,
    this.employeRole,
    this.employePhoneNumber,
    this.employeAddress,
    this.createdAt,
    this.updatedAt,
  });

  // Fungsi toJson untuk mengubah objek menjadi Map yang dapat di-encode ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employe_name': employeName,
      'employe_role': employeRole,
      'employe_phone_number': employePhoneNumber,
      'employe_address': employeAddress,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Fungsi fromJson untuk membuat objek Employee dari data JSON
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      employeName: json['employe_name'],
      employeRole: json['employe_role'],
      employePhoneNumber: json['employe_phone_number'],
      employeAddress: json['employe_address'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}