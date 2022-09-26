import 'package:cat_api/presentation/model/ca_pl_breed_score.dart';
import 'package:flutter/material.dart';

class CABreedScoreCard extends StatelessWidget {
  CAPLBreedScore cAPLBreedSocre;
  CABreedScoreCard(this.cAPLBreedSocre, {super.key});

  @override
  Widget build(BuildContext context) {
    cAPLBreedSocre;
    return Column(

      children: [
        const Divider(),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 230,
            child: Column(            
              children: [
                      Row(children: [Text('Name:',style: Theme.of(context).textTheme.headline2),
                         Text( '${cAPLBreedSocre.name}',style: Theme.of(context).textTheme.subtitle1)]),
                      Row(children: [Text('Origin:',style: Theme.of(context).textTheme.headline2),
                         Text('${cAPLBreedSocre.origin}',style: Theme.of(context).textTheme.subtitle1)])
              ],
            ),
          ),
          Icon(cAPLBreedSocre.icon)
        ],
      ),
      const Divider()
      ]
    );
  }
}
