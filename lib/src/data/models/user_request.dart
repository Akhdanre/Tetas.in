class RegisterRequest {
  String username;
  String password;
  String name;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password, 'name': name};
  }
}
