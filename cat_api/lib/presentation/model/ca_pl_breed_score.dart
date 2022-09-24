import 'package:cat_api/bussines_logic/model/breed_model.dart';

class CAPLBreedScore {
  String? id;
  String? name;
  String? origin;
  int? voteValue;
  String? imageUrl;

  CAPLBreedScore.fromBLBreed(BLBreed bLBreed, int voteValueAux) {
    id = bLBreed.id;
    name = bLBreed.name;
    origin = bLBreed.origin;
    imageUrl = bLBreed.image?.url;
    voteValue = voteValueAux;
  }
  @override
  String toString() {
    return "name: $name origin $origin   imageURL $imageUrl vote value $voteValue";
  }
}
