class User {
  String token;
  String name;
  String email;
  String password;

  User({
    required this.token,
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        token: json["token"],
        email: json["user"]["email"],
        name: json["user"]["name"],
        password: json["user"]["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "name": this.name,
      "token": this.token,
      "password": this.password
    };
  }
}
