import 'package:cat_api/data/breeds_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/ca_breed_slider.dart';

class BreedVotationMenuView extends StatelessWidget {
  const BreedVotationMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 186, 243, 255),
        appBar: AppBar(
          title: const Text("Cats API"),
          elevation: 0,
          // ignore: avoid_print
          actions: [
            IconButton(
                onPressed: (() => {breedProvider.showBreedsAndScore()}),
                icon: const FaIcon(FontAwesomeIcons.heart)),
            IconButton(
                onPressed: (() => {breedProvider.showBreedGroupedByName()}),
                icon: const FaIcon(FontAwesomeIcons.arrowUpAZ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [CABreedSlider()],
            ),
          ),
        ),
      ),
    );
  }
}
