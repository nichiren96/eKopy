import 'dart:convert';

import 'package:ekopy/src/constants/urls.dart';
import 'package:ekopy/src/models/internship_model.dart';
import 'package:http/http.dart' show Client;

class InternShipService {
  Client client = Client();

  Future<List<Internship>> getAll() async {
    final response = await client.get(Uri.parse('$BASEURL/api/v1/internships'));

    final body = json.decode(response.body);
    List<Internship> _internships = [];

    //print(body);

    body.forEach((internship) {
      _internships.add(Internship.fromJson(internship as Map<String, dynamic>));
    });

    print(_internships);

    return _internships;
  }
}
