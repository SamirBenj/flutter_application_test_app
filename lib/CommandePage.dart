import 'package:flutter/material.dart';
import 'DernierePage.dart';

class CommandePage extends StatefulWidget {
  const CommandePage({Key? key}) : super(key: key);

  @override
  State<CommandePage> createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Commande',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(111, 186, 255, 100),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Votre adresse",
                          labelText: "Adresse",
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                          border: OutlineInputBorder()),
                      obscureText: false,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Votre adresse",
                          labelText: "Numero rue",
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: false,
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DernierePage()));
              },
              child: Text('Valider'),
            ),
          )
        ],
      ),
    );
  }
}
