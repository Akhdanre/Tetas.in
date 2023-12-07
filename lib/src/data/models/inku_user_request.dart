class InkuUserRequest {
  String id;
  String token;
  String username;

  InkuUserRequest({
    required this.id,
    required this.token,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'token': token, 'username': username};
  }
}
