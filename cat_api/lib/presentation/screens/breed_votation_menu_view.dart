import 'package:cat_api/commons/text_style/ca_theme_data.dart';
import 'package:cat_api/data/breeds_provider.dart';
import 'package:cat_api/presentation/model/TipeOfView.dart';
import 'package:cat_api/presentation/widgets/ca_breedScore_card.dart';
import 'package:cat_api/presentation/widgets/ca_breed_ordered_by_name_card.dart';
import 'package:cat_api/presentation/widgets/ca_breed_votation_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BreedVotationMenuView extends StatelessWidget {
  const BreedVotationMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    return MaterialApp(
      theme: CAThemeData,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 186, 243, 255),
        appBar: AppBar(
          title: const Text("Cats API"),
          elevation: 0,
          // ignore: avoid_print
          actions: const [BreedsScoreButton(), BreedsGroupedByNameButton(),],
        ),
        endDrawer: Drawer(
          child: SafeArea(
              child: Container(
            color: Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(breedProvider.getTitleOfView()),
                  const Divider(),
                  const BreedsByTipeOfView(),
                ]),
          )),
        ),
        body: SafeArea(
          child: getRandomVotationBreed(context),
        ),
      ),
    );
  }

  getRandomVotationBreed(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    return Container(
      color: const Color.fromARGB(255, 95, 139, 221),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Colors.amber,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: breedProvider.isBreedsAvailable
                  ? const CABreedVotationCard()
                  : const Text("Loading..."),
            ),
          ),
        ],
      ),
    );
  }
}

class BreedsByTipeOfView extends StatelessWidget {
  const BreedsByTipeOfView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    TipeOfView tipeOfView = breedProvider.tipeOfView;
    int totalBreedsAvailableByTypeOfView =
        breedProvider.getTotalBreedsAvailableByTipeOfView();
    // return Text('asdfads');
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: totalBreedsAvailableByTypeOfView,
        itemBuilder: (context, index) {
          return getBreedCardByTypeOfView(tipeOfView, context, index);
          // CABreedOderedByNameCard(breedsProvider.getCAPLBreedOrderedByName(index));
        },
      ),
    );
  }

  Widget getBreedCardByTypeOfView(
      TipeOfView tipeOfView, BuildContext context, int index) {
    switch (tipeOfView) {
      case TipeOfView.BREEDS_AND_SCORE:
        {
          return getBreedsScore(context, index);
        }
      case TipeOfView.BREED_ORDERED_BY_INITIAL:
        {
          return getBreedsOrderedByInitialName(context, index);
        }
      default:
        {
          return const Text("default");
        }
    }
  }

  Widget getBreedsOrderedByInitialName(BuildContext context, int index) {
    var breedsProvider = Provider.of<BreedsProvider>(context);
    return CABreedOderedByNameCard(
        breedsProvider.getCAPLBreedOrderedByName(index));
  }

  Widget getBreedsScore(BuildContext context, int index) {
    var breedsProvider = Provider.of<BreedsProvider>(context);
    return CABreedScoreCard(breedsProvider.getCAPLBreedSocre(index));
  }
}

class BreedsScoreButton extends StatelessWidget {
  const BreedsScoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    var breedsProvider = Provider.of<BreedsProvider>(context);
    return IconButton(
        onPressed: (() => {
              breedsProvider.setTipeOfView(TipeOfView.BREEDS_AND_SCORE),
              Scaffold.of(context).openEndDrawer()
            }),
        icon: const FaIcon(FontAwesomeIcons.heart));
  }
}

class BreedsGroupedByNameButton extends StatelessWidget {
  const BreedsGroupedByNameButton({super.key});

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    return IconButton(
        onPressed: (() => {
              breedProvider.setTipeOfView(TipeOfView.BREED_ORDERED_BY_INITIAL),
              Scaffold.of(context).openEndDrawer()
            }),
        icon: const FaIcon(FontAwesomeIcons.arrowUpAZ));
  }
}
