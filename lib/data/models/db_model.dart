const String userTable = "cached_user";

class UsersFields {
  static final List<String> values = [
    /// Add all fields
    id, name, age,
  ];
  static const String id = "_id";
  static const String name = "name";
  static const String age = "age";
}

class UserModel {
  final int? id;
  final String? name;
  final String? age;

  UserModel({this.id, required this.age, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"] as int? ?? -1,
        age: json["age"] as String? ?? "",
        name: json["name"] as String? ?? "");
  }

  Map<String, dynamic> toJson() => {
        UsersFields.id: id,
        UsersFields.name: name,
        UsersFields.age: age,
      };

  UserModel copyWith({
    int? id,
    String? age,
    String? name,
  }) =>
      UserModel(
        id: id ?? this.id,
        age: age ?? this.age,
        name: name ?? this.name,
      );
}
