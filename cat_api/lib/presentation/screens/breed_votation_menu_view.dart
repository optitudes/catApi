import 'package:flutter/material.dart';
import '../widgets/ca_breed_slider.dart';

class BreedVotationMenuView extends StatelessWidget {
  const BreedVotationMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text("Cats API"),
          actions: const [Text("Action 1"),Text("Action 2")],
        ),
        body: SafeArea(
          child: Center(
              child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [ CABreedSlider()],
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
