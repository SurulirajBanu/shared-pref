class User {
  /// Name of the user
  String? name;

  /// Email ID of the user
  String email;

  /// Constructor
  User({this.name, required this.email});

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
