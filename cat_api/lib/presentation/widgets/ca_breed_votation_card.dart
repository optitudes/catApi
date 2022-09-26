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
              // ignore: prefer_const_constructors
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text('Name:',style: Theme.of(context).textTheme.headline4),
                              Text('${breedSelected.name}',style: Theme.of(context).textTheme.subtitle1),
               Text('Temperament:',style: Theme.of(context).textTheme.headline4),
                              Text('${breedSelected.temperament}',style: Theme.of(context).textTheme.subtitle1),
               Text('Origin:',style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center,),
                              Text('${breedSelected.origin}',style: Theme.of(context).textTheme.subtitle1),
               Text('Description:',style: Theme.of(context).textTheme.headline4),
                              Text('${breedSelected.description}\n',style: Theme.of(context).textTheme.subtitle1),               
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () =>
                          {breedProvider.addVoteLikeToBreed(breedSelected.id)},
                      icon: const FaIcon(FontAwesomeIcons.heartCirclePlus)),
                  IconButton(
                      onPressed: () =>
                          {breedProvider.addVoteDislikeToBreed(breedSelected.id)},
                      icon: const FaIcon(FontAwesomeIcons.heartCircleMinus)),
                  IconButton(
                      onPressed: () =>
                          {breedProvider.updateCAPLVotationBreedSelected()},
                      icon: const FaIcon(FontAwesomeIcons.arrowRight)),
                ],
              )
            ])

          ],
        );
      },
    );
  }
}
