
//  class CABreedScoreCard {

//   static Widget build(CAPLBreedScore cAPLBreedScore) {
//     bool isLikeVote = cAPLBreedScore.voteValue == 1;
//     return Row(
//       children: [Text('${cAPLBreedScore.name}', style: const TextStyle(backgroundColor: Colors.amber ),),
//                  getIcon: const FaIcon(FontAwesomeIcons.heart)
//                  ],
//     );
//   }

//   static Icon getIcon(bool isLikeVote){
//     isLikeVote?
//     return const Icon( FaIcon(FontAwesomeIcons.heartCircleMinus)) :
//     return Icon( FaIcon(FontAwesomeIcons.heartCircleMinus))
//   }

//   }

import 'package:cat_api/presentation/model/ca_pl_breed_score.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CABreedScoreCard extends StatelessWidget {
  CAPLBreedScore cAPLBreedSocre;
  CABreedScoreCard(this.cAPLBreedSocre, {super.key});

  @override
  Widget build(BuildContext context) {
    cAPLBreedSocre;
    bool isLikeVote = cAPLBreedSocre.voteValue == 1;

    return Row(
      children: [
        Column(
          children: [
            Text('${cAPLBreedSocre.name}'),
            Text('${cAPLBreedSocre.origin}')
          ],
        ),
        Icon(cAPLBreedSocre.icon)
      ],
    );
  }

  // IconData? getIconFromVote(int? voteValue) {
  //   bool isVoteLile
  //   if(voteValue ==)
  // }
}
