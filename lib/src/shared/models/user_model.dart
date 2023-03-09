
import 'dart:convert';

class UserModel {

  String name;
  String password;
  
  UserModel({
    required this.name,
    required this.password,
  });
  

  UserModel copyWith({
    String? name,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, password: $password)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ password.hashCode;
}
