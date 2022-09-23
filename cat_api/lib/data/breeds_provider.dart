import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cat_api/presentation/model/TipeOfList.dart';
import 'package:cat_api/presentation/model/ca_pl_votation_breed.dart';
import 'package:flutter/material.dart';
// import 'dart:convert' as convert;

import 'package:cat_api/bussines_logic/model/breed_model.dart';

class BreedsProvider extends ChangeNotifier {
  final String _baseURl = 'api.thecatapi.com';
  final String _allBreedsURLComplement = '/v1/breeds';
  Map<String, int> breedsScores = {};
  List<BLBreed> breedsAvailable = [];
  bool isBreedsAvailable = false;
  CAPLVotationBreed? breedSelected;
  TipeOfList tipeOfList = TipeOfList.INFO;

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
        bool isValidImage = validateImage(element);
        if (isValidImage) {
          breedsAvailableAux.add(BLBreed.fromJson(element));
        }
      }
      breedsAvailable = breedsAvailableAux;
      isBreedsAvailable = true;
      breedSelected = getRandomCAPLBreed();

      notifyListeners();
    } else {
      // print('Ocurrió un error al obtener las razas: ${response.statusCode}.');
    }
  }

  updateCAPLBreedSelected() {
    breedSelected = getRandomCAPLBreed();
    notifyListeners();
  }

  CAPLVotationBreed? getRandomCAPLBreed() {
    if (isBreedsAvailable) {
      int breedPos = Random().nextInt(breedsAvailable.length);

      return CAPLVotationBreed.fromBLBreed(breedsAvailable[breedPos]);
    } else {
      return null;
    }
  }

  bool validateImage(Map<String, dynamic> element) {
    bool isValidImage = false;
    // preguntar a carlos cómo implementar alguna alternativa al guard let aquí
    if (element['image'] != null && element['image']['url'] != null) {
      isValidImage = true;
    }
    return isValidImage;
  }

  showBreedsAndScore() {
    print("### las razas y sus puntajes no estan disponibles por el momento");
  }

  showBreedGroupedByName() {
    print("### las razas agrupadas por nombre no están disponibles");
  }

  addVoteUpToBreed(String? breedId) {
    bool isValidId = validateBreedId(breedId);
    print("estado del id para voto positivo $isValidId");
    if (isValidId) {
      addVoteToBreed(breedId!, 1);
    }
  }

  addVoteToBreed(String id, int voteValue) {
    bool isIdAlreadyRegistered = breedsScores.containsKey(id);

    isIdAlreadyRegistered
        ? breedsScores[id] = voteValue
        : breedsScores.addAll({id: voteValue});
    print(breedsScores.keys);
    print(breedsScores.values);

    updateCAPLBreedSelected();
    notifyListeners();
  }

  addVoteDownToBreed(String? breedId) {
    bool isValidId = validateBreedId(breedId);
    if (isValidId) {
      addVoteToBreed(breedId!, -1);
    }
  }

  bool validateBreedId(String? breedId) {
    return breedId != null && breedId.isNotEmpty;
  }

  setTipeOfList(TipeOfList breeds_and_score) {
    print("## breedTipe $breeds_and_score breed actual $tipeOfList");
    tipeOfList = breeds_and_score;
    print("## estado final${this.tipeOfList}");
    notifyListeners();
  }

  String getEndTitle() {
    print(tipeOfList);
    switch (tipeOfList) {
      case TipeOfList.INFO:
        {
          return "infomacion";
        }
      case TipeOfList.BREEDS_AND_SCORE:
        {
          return "raza y scrore";
        }
      case TipeOfList.BREED_ORDERED_BY_INITIAL:
        {
          return "Raza ordenada por inicial";
        }
      default:
        {
          return "ni idea pa";
        }
    }
  }

  getNumberOfRatedBreeds() {
    return breedsScores.length;
  }

  CAPLVotationBreed? getCAPLBreedSelected() {
    return breedSelected;
  }
}
