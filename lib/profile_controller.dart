import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class profile extends ChangeNotifier {

  Map<String, dynamic> listtags = {};

  Map<String, dynamic> get list => listtags;

  int get jumlahData => listtags.length;

  late Uri url;

  //Post
  void connectAPI(String name, String job, String email) async {
    url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
        "email": email,
      },
    );

    listtags = json.decode(hasilResponse.body);
    notifyListeners();
  }

  //Get
  void getconnectAPI(String id) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    listtags = (json.decode(hasilResponse.body))["data"];
    notifyListeners();
  }

  //Put
  void putconnectAPI(String name, String job, String email
      ) async {
    url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.put(
      url,
      body: {
        "name": name,
        "job": job,
        "email": email,
      },
    );

    listtags = json.decode(hasilResponse.body);
    notifyListeners();
  }

  //Delet
  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(url);

    print(hasilResponse.statusCode);

    if (hasilResponse.statusCode == 204) {
      listtags = {};
      notifyListeners();
    }
  }

}