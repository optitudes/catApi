import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

import 'package:cat_api/bussines_logic/model/breed_model.dart';

class BreedsProvider extends ChangeNotifier {
  final String _baseURl = 'api.thecatapi.com';
  final String _allBreedsURLComplement = '/v1/breeds';
  List<BLBreed> breedsAvailable = [];

  BreedsProvider() {
    getBreedsAvailables();
  }
  getBreedsAvailables() async {
    
    final url = Uri.https(_baseURl, _allBreedsURLComplement, {'q': '{http}'});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<BLBreed> breedsAvailableAux = [];
      List<dynamic> breedsObtained = jsonDecode(response.body);

      for (Map<String, dynamic> element in breedsObtained) {
        breedsAvailableAux.add(BLBreed.fromJson(element));
      }
      breedsAvailable = breedsAvailableAux;

      notifyListeners();
    } else {
      // print('Ocurrió un error al obtener las razas: ${response.statusCode}.');
    }
  }
}
