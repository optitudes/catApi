import 'package:cat_api/data/breeds_provider.dart';
import 'package:cat_api/presentation/model/ca_pl_votation_breed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CABreedVotationCard extends StatelessWidget {
  const CABreedVotationCard({super.key});


  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    CAPLVotationBreed? breedSelected = breedProvider.getCAPLBreedSelected();
    
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 300,
                maxWidth: 300,
              ),
              child: FadeInImage(
                image: NetworkImage(breedSelected!.imageUrl ?? ""),
                fit: BoxFit.cover,
                placeholder: const AssetImage("lib/resources/png/loadind.webp"),
              ),
            ),
            Column(children: [
              Text("Name : ${breedSelected.name}"),
              Text("Temperament : ${breedSelected.temperament}"),
              Text("Origin : ${breedSelected.origin}"),
              Text("Description : ${breedSelected.description}\n"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () =>
                          {breedProvider.addVoteUpToBreed(breedSelected!.id)},
                      icon: const FaIcon(FontAwesomeIcons.heartCirclePlus)),
                  IconButton(
                      onPressed: () =>
                          {breedProvider.addVoteDownToBreed(breedSelected!.id)},
                      icon: const FaIcon(FontAwesomeIcons.heartCircleMinus)),
                ],
              )
            ])
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
      },
    );
  }
}
