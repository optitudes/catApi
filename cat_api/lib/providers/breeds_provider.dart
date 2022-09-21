import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:cat_api/model/breed_model.dart';

class BreedsProvider extends ChangeNotifier {
  String _baseURl = 'api.thecatapi.com';
  String _allBreedsURLComplement = '/v1/breeds';
  // String _apiKey = '';

  BreedsProvider() {
    print("#######Iniciando el breeds provider");
    getBreedsAvailables();
  }
  getBreedsAvailables() async {
    print("#######getBreedsAvailables");

    var url = Uri.https(_baseURl, _allBreedsURLComplement, {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List< Map<String, dynamic> > breedsObtainedFromApi = jsonDecode(response.body);
      print(breedsObtainedFromApi);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
