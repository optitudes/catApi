import 'package:cat_api/bussines_logic/model/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CAPLBreedScore {
  String? id;
  String? name;
  String? origin;
  int? voteValue;
  String? imageUrl;
  IconData? icon;

  CAPLBreedScore.fromBLBreed(BLBreed bLBreed, int voteValueAux) {
    id = bLBreed.id;
    name = bLBreed.name;
    origin = bLBreed.origin;
    imageUrl = bLBreed.image?.url;
    voteValue = voteValueAux;
    icon = getIconFromVoteValue(voteValueAux);
  }
  @override
  String toString() {
    return "name: $name origin $origin   imageURL $imageUrl vote value $voteValue";
  }

  IconData? getIconFromVoteValue(int voteValue) {
    bool isLikeVote = voteValue == 1;
    if (isLikeVote) {
      return FontAwesomeIcons.heartCirclePlus;
    }
    return FontAwesomeIcons.heartCircleMinus;
  }
}
