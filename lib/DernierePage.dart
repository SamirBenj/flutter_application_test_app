import 'package:flutter/material.dart';

class DernierePage extends StatefulWidget {
  const DernierePage({Key? key}) : super(key: key);

  @override
  State<DernierePage> createState() => _DernierePageState();
}

class _DernierePageState extends State<DernierePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/commandeValider.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Commande en préparation',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'La commande arrivera dans quelque minutes',
                style: TextStyle(fontSize: 18),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Accueil'),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          ],
        ),
      ),
    );
  }
}
