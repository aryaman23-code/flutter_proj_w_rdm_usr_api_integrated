import 'package:flutter/material.dart';
import 'screen/home.dart';
import 'screen/description.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
        '/': (context) => const HomeScreen(),
        '/description': (context) => const Description(),
        
      },
));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }


// void main() => runApp(MaterialApp(
//       // home:Home(),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const QuoteList(),
//         '/description': (context) => const Description(),
        
//       },
//     ));
