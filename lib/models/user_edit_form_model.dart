class UserEditFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  UserEditFormModel({
    this.name,
    this.password,
    this.username,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password
    };
  }
}
