import 'package:cat_api/bussines_logic/model/breed_model.dart';

class CAPLVotationBreed {
  String? name;
  String? temperament;
  String? origin;
  String? description;
  String? imageUrl;

  CAPLVotationBreed.fromBLBreed(BLBreed bLBreed) {
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
