import 'package:cat_api/bussines_logic/model/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/breeds_provider.dart';

class CABreedSlider extends StatelessWidget {
  CABreedSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    List<BLBreed> breedsAvailable = breedProvider.breedsAvailable;
    bool isBreedsAvailable = breedsAvailable.isNotEmpty;
    String? url = isBreedsAvailable? breedsAvailable[0].image?.url : "https://is3-ssl.mzstatic.com/image/thumb/Music6/v4/d5/be/ef/d5beefbe-b755-4dfd-dbf7-534aeeb8df79/811868414980_cover.jpg/500x500bb.webp";
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          image: NetworkImage(url!),
          fit: BoxFit.cover,
          placeholder: AssetImage("lib/resources/png/no-cat.jpeg"),
        ),
      ),
    );
  }
}
