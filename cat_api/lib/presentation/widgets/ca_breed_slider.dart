import 'package:cat_api/presentation/model/ca_pl_votation_breed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/breeds_provider.dart';

class CABreedSlider extends StatelessWidget {
  const CABreedSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    CAPLVotationBreed? randomCAPLBreed = breedProvider.getRandomCAPLBreed();

    return Container(
      color: const Color.fromARGB(255, 95, 139, 221),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: breedProvider.isBreedsAvailable?
        FadeInImage(
          image: NetworkImage(randomCAPLBreed!.imageUrl ?? ""),
             fit: BoxFit.cover,
          placeholder: const AssetImage("lib/resources/png/loadind.webp"),
        )
        :
        const Text("Loading...")
      ,),
    );
  }
}
