import 'package:cat_api/data/breeds_provider.dart';
import 'package:cat_api/presentation/model/ca_pl_votation_breed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CABreedVotationCard extends StatelessWidget {
  const CABreedVotationCard({super.key});


  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    CAPLVotationBreed? breedSelected = breedProvider.breedSelected;
    return Column(
      children: [
        FadeInImage(
          image: NetworkImage(breedSelected!.imageUrl ?? ""),
          fit: BoxFit.cover,
          placeholder: const AssetImage("lib/resources/png/loadind.webp"),
        ),
        Column(
          children:   [ Text("Name : ${breedSelected.name}"),
                        Text("Temperament : ${breedSelected.temperament}"),
                        Text("Origin : ${breedSelected.origin}"),
                        Text("Description : ${breedSelected.description}")
                      ]
                     

        )
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(20),
        //   child: breedProvider.isBreedsAvailable
        //       ? FadeInImage(
        //           image: NetworkImage(randomCAPLBreed!.imageUrl ?? ""),
        //           fit: BoxFit.cover,
        //           placeholder:
        //               const AssetImage("lib/resources/png/loadind.webp"),
        //         )
        //       : const Text("Loading..."),
        // ),
        // Text("data")
      ],
    );
  }
}
