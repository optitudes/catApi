import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../data/breeds_provider.dart';
import 'ca_breed_votation_card.dart';

class CABreedSlider extends StatelessWidget {
  const CABreedSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    return Container(
      color: const Color.fromARGB(255, 95, 139, 221),
      child: Column(
        children: [ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: breedProvider.isBreedsAvailable?
          const CABreedVotationCard()
          :
          const Text("Loading...")
        ,),
        

        ],
      ),
    );
  }
}
