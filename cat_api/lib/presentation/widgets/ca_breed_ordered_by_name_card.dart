import 'package:cat_api/presentation/model/ca_pl_breed_decription.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* class CABreedOrderedByNameCard extends StatefulW {
  CAPLBreedDescription cAPLBreedDescription;
  String? description;
  CABreedOrderedByNameCard(this.cAPLBreedDescription, {super.key});

  @override
  Widget build(BuildContext context) {
    cAPLBreedDescription;
    return Row(
      children: [
        Column(children: [
          Text(description ?? ""),
          IconButton(
              onPressed: () {
                changeTitle();
              },
              icon: const FaIcon(FontAwesomeIcons.heart))
        ])
      ],
    );
  }

  changeTitle() {
    description = 'hola';
    print('hola cambiado $description');
  }
} */

class CABreedOderedByNameCard extends StatefulWidget {
  CAPLBreedDescription cAPLBreedDescription;
  String description = '';
  CABreedOderedByNameCard(this.cAPLBreedDescription, {super.key});

  @override
  State<CABreedOderedByNameCard> createState() => CABreedOrderedByNameCard();
}

class CABreedOrderedByNameCard extends State<CABreedOderedByNameCard> {
  @override
  Widget build(BuildContext context) {
    widget.cAPLBreedDescription;
    return Column(children: [
      const Divider(),
      Row(children: [Text('Name:',style: Theme.of(context).textTheme.headline2),
                     Text( '${widget.cAPLBreedDescription.name}',style: Theme.of(context).textTheme.subtitle1)]),
      Row(children: [Text('Origin:',style: Theme.of(context).textTheme.headline2),
                     Text('${widget.cAPLBreedDescription.origin}',style: Theme.of(context).textTheme.subtitle1)]),                
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(widget.description, style: Theme.of(context).textTheme.subtitle1),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                setDescriptionInfo();
              },
              icon: const FaIcon(FontAwesomeIcons.plus)),
          IconButton(
              onPressed: () {
                clearDescriptionInfo();
              },
              icon: const FaIcon(FontAwesomeIcons.minus))
        ],
      ),
      const Divider()
    ]);
  }

  setDescriptionInfo() {
    setState(() {
      widget.description =
          '${widget.cAPLBreedDescription.description}';
    });
  }

  clearDescriptionInfo() {
    setState(() {
      widget.description = '';
    });
  }
}
