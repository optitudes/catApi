import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          elevation: 0,
          // ignore: avoid_print
          actions: [
            IconButton(
                onPressed: (() => {print("object")}),
                icon: const FaIcon(FontAwesomeIcons.heart)
                ),
             IconButton(
                onPressed: (() => {print("object")}),
                icon: const FaIcon(FontAwesomeIcons.arrowUpAZ)
                )
          ],
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [CABreedSlider()],
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
