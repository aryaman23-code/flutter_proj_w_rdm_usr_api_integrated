import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      print(data);
      print(data['user']);
    } catch (e) {
      data = data;
    }
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pop(context, '/');
      },
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Container(
                margin: EdgeInsets.all(16),
                child: Hero(
                    tag: 'imp',
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          data['user'].pic.large,
                        ),
                        radius: 120,
                      ),
                    ))),
            const SizedBox(
              height: 14,
            ),
            Text(
              data['user'].location.state,
            )
          ],
        ),
      ),
    ));
  }
}
