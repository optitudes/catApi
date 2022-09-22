import 'package:cat_api/data/breeds_provider.dart';
import 'package:cat_api/presentation/screens/breed_votation_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BreedsInfoState());
}

// class BreedVotationApp extends StatelessWidget {
//   const BreedVotationApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     var model = Provider.of<BreedsProvider>(context);
//     String ejemplo = '222';
//     // print('#lg ${model.ejemplo}');
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//                             ElevatedButton(
//                 onPressed: () {
//                   model.cambioEjemplo();
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                       model.styleButton ? Colors.amber : Colors.red),
//                 ),
//                 child: Text('press'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class BreedsInfoState extends StatelessWidget {
  const BreedsInfoState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((_) => BreedsProvider()),
          lazy: false,
        )
      ],
      child: const BreedVotationMenuView(),
    );
  }
}
