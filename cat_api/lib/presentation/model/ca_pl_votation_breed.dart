import 'package:cat_api/bussines_logic/model/breed_model.dart';

class CAPLVotationBreed {
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? description;
  String? imageUrl;

  CAPLVotationBreed.fromBLBreed(BLBreed bLBreed) {
    id = bLBreed.id;
    name = bLBreed.name;
    temperament = bLBreed.temperament;
    origin = bLBreed.origin;
    description = bLBreed.description;
    imageUrl = bLBreed.image?.url;
  }
  @override
  String toString() {
    return "name: $name temperament: $temperament origin $origin  description $description imageURL $imageUrl";
  }
}
