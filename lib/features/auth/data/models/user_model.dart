class UserModel {
  String name;
  String phone;
  String address;
  String age;
  String email;

  UserModel(
      {required this.name,
      required this.phone,
      required this.address,
      required this.age,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      age: json['age'] as String,
      email: json['email'] as String);

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'address': address,
        'age': age,
        'email': email
      };
}
