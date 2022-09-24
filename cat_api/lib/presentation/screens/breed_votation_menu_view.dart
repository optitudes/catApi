import 'package:cat_api/data/breeds_provider.dart';
import 'package:cat_api/presentation/model/TipeOfList.dart';
import 'package:cat_api/presentation/widgets/ca_breedScore_card.dart';
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
          actions: [const ShowBreedsScoreButton(), ShowBreedsGroupedByName()],
        ),
        endDrawer: Drawer(
          child: SafeArea(
              child: Container(
            color: Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(breedProvider.getEndTitle()),
                  const Divider(),
                  BreedListView(),
                ]),
          )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [CABreedSlider()],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowBreedsGroupedByName extends StatelessWidget {
  const ShowBreedsGroupedByName({super.key});

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    return IconButton(
        onPressed: (() => {
              breedProvider.setTipeOfList(TipeOfList.BREED_ORDERED_BY_INITIAL),
              Scaffold.of(context).openEndDrawer()
            }),
        icon: const FaIcon(FontAwesomeIcons.arrowUpAZ));
  }
}

class BreedListView extends StatelessWidget {
  const BreedListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breedProvider = Provider.of<BreedsProvider>(context);
    TipeOfList tipeOfList = breedProvider.tipeOfList;
    // return Text('asdfads');
    return Expanded(
      child: ListView(
        children: [getCardsOfView(tipeOfList, context)],
      ),
    );
  }

  Widget getCardsOfView(TipeOfList tipeOfList, BuildContext context) {
    switch (tipeOfList) {
      case TipeOfList.BREEDS_AND_SCORE:
        {
          return getBreesScore(context);
        }
      case TipeOfList.BREED_ORDERED_BY_INITIAL:
        {
          return getBreedsOrderedByInitialName(context);
        }
      default:
        {
          return Text("default");
        }
    }
  }

  Widget getBreedsOrderedByInitialName(BuildContext context) {
    var breedsProvider = Provider.of<BreedsProvider>(context);
    int totalBreedsAvailable = breedsProvider.breedsAvailable.length;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: totalBreedsAvailable,
      itemBuilder: (context, index) {
        return Text('${breedsProvider.getCAPLBreedOrderedByName(index)}');
      },
    );
  }
  
  Widget getBreesScore(BuildContext context) {
    var breedsProvider = Provider.of<BreedsProvider>(context);
    int totalBreedsScoreAvailable = breedsProvider.breedsScores.length;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: totalBreedsScoreAvailable,
      itemBuilder: (context, index) {
        return CABreedScoreCard(breedsProvider.getCAPLBreedSocre(index));
      },
    );
  }
}

class ShowBreedsScoreButton extends StatelessWidget {
  const ShowBreedsScoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    var breedsProvider = Provider.of<BreedsProvider>(context);
    return IconButton(
        onPressed: (() => {
              breedsProvider.setTipeOfList(TipeOfList.BREEDS_AND_SCORE),
              Scaffold.of(context).openEndDrawer()
            }),
        icon: const FaIcon(FontAwesomeIcons.heart));
  }
}
