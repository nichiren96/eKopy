import 'dart:convert';

import 'package:ekopy/src/constants/urls.dart';
import 'package:ekopy/src/models/user_model.dart';
import 'package:http/http.dart' show Client;

class AuthService {
  Client client = Client();

  Future<User> login(String email, String password) async {
    final response = await client.post(Uri.parse('$BASEURL/api/v1/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    final body = json.decode(response.body);

    return User.fromJson(body);
  }

  Future<User> register(String name, String email, String password) async {
    final user = User(token: "", email: email, name: name, password: password);

    final response =
        await client.post(Uri.parse('$BASEURL/api/v1/users/register'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(user.toJson()));

    final body = json.decode(response.body);

    return User.fromJson(body);
  }
}
