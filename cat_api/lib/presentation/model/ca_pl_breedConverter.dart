import '../../bussines_logic/model/breed_model.dart';
import 'ca_pl_votation_breed.dart';

class CAPLBreedConverter {
  static CAPLVotationBreed? convertFromBLBreedToCAPLVotationBreed(
      {required BLBreed blBreed}) {

    CAPLVotationBreed cAPlVotationBreed = CAPLVotationBreed.fromBLBreed(blBreed);
    return cAPlVotationBreed;
  }
}
