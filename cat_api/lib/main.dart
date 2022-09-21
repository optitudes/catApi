import 'package:cat_api/providers/breeds_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BreedsInfoState());
}

class BreedVotationApp extends StatelessWidget {
  const BreedVotationApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Center(
            child: Text(
      "api cat",
      style: TextStyle(fontSize: 12),
    )));
  }
}

class BreedsInfoState extends StatelessWidget {
  const BreedsInfoState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: ((_) => BreedsProvider()),lazy: false,
      )
    ],
    child: const BreedVotationApp(),
    );
  }
}
