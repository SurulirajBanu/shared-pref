class User {
  String name;
  String email;

  User({required this.name, required this.email});

  /// [fromJson] method to parse [json] value from API into [User] object
  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      name: json?['name'],
      email: json?['email'],
    );
  }

  /// [toJson] method to convert [User] object to a Map
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
