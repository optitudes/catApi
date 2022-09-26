

import 'package:cat_api/presentation/model/ca_pl_breed_score.dart';

import '../../bussines_logic/model/breed_model.dart';
import 'ca_pl_votation_breed.dart';

class CAPLBreedConverter {
  static CAPLVotationBreed? convertFromBLBreedToCAPLVotationBreed(
      {required BLBreed blBreed}) {
    CAPLVotationBreed cAPlVotationBreed =
        CAPLVotationBreed.fromBLBreed(blBreed);
    return cAPlVotationBreed;
  }

  static CAPLBreedScore? convertFromBLBreedToCAPLBreedScore(
      {required BLBreed bLBreed, required int voteValue}) {
        
    return CAPLBreedScore.fromBLBreed(bLBreed, voteValue);
  }
}
