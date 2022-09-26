import 'package:cat_api/bussines_logic/model/breed_model.dart';

class CAPLBreedDescription {
  String? id;
  String? name;
  String? origin;
  String? imageUrl;
  String? description;

  CAPLBreedDescription.fromBLBreed(BLBreed bLBreed) {
    id = bLBreed.id;
    name = bLBreed.name;
    origin = bLBreed.origin;
    imageUrl = bLBreed.image?.url;
    description = bLBreed.description;
  }
  @override
  String toString() {
    return "name: $name origin $origin   imageURL $imageUrl description $description";
  }
}
