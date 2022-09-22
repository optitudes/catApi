import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/breeds_provider.dart';
import '../widgets/ca_breed_slider.dart';

class BreedVotationMenuView extends StatelessWidget {
  const BreedVotationMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var breedsProvider = Provider.of<BreedsProvider>(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text("Cats API"),
        ),
        body: SafeArea(
          child: Center(
              child: Column(
              

              
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [CABreedSlider()],
          )
              // Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // children: const [ Text("Score",style: TextStyle(fontSize: 30)), Text("0",style: TextStyle(fontSize: 30))],
              // )
              ),
        ),
      ),
    );
  }
}

class CACardBreed extends StatelessWidget {
  String title = '';
  CACardBreed({String title = 'vacio'});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
