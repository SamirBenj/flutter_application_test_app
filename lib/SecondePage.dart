import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projet_food/Classes/produit.dart';
import 'DetailsPage.dart';
import 'CategoriePage.dart';
import 'PanierPage.dart';

class SecondePage extends StatefulWidget {
  const SecondePage({Key? key}) : super(key: key);

  @override
  State<SecondePage> createState() => _SecondePageState();
}

class _SecondePageState extends State<SecondePage> {
  int totalPanier = 0;
  bool checkbox = false;

  fonctionAddition() {
    totalPanier++;
  }

  fonctionSoustraction() {
    totalPanier--;
  }

  List<Produit> produits = [
    Produit("burger", "Sushi", 15, "assets/Chorizo.jpg", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 2),
    Produit("pizza", "Sushi", 15, "assets/salad.png", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 3),
    Produit("burger", "Sushi", 15, "assets/Chorizo.jpg", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 4),
  ];

  String _valueSelected = "1";

  @override
  Widget build(BuildContext context) {
    var produitSelectionner = produits.where((element) => element.valeurBool);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(111, 186, 255, 100),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PanierPage(panierInfo: produitSelectionner)));
            },
            icon: Icon(
              Icons.shopping_basket,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(totalPanier.toString()),
          // Image.asset('assets/Chorizo.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriePage()));
                  },
                  child: Text('Categories'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Recettes'),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                //FutureBuilder(
                //   builder: (context, snapshot) {
                //     var produits = json.decode(snapshot.data.toString());
                GridView.builder(
              itemCount: produits.length,
              itemBuilder: (BuildContext context, int index) {
                // print(produits[index]['nom'].toString());
                // var nom = produits[index]['nom'];
                // print(produits[index]['valeurBool']);

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2.0,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            '${produits[index].imageProduit}',
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  produits[index].nomProduit.toString(),
                                ),
                                Text(
                                  '${produits[index].prix}' + '€',
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${produits[index].description}',
                              maxLines: 5,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(7.0),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.orangeAccent),
                                        ),
                                        filled: true,
                                        fillColor: Colors.orangeAccent,
                                      ),
                                      dropdownColor: Colors.orangeAccent,
                                      items: [
                                        DropdownMenuItem(
                                          value: '1',
                                          child: Text('1'),
                                        ),
                                        DropdownMenuItem(
                                          value: '2',
                                          child: Text('2'),
                                        ),
                                      ],
                                      value: _valueSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          _valueSelected != value;
                                        });
                                        //recuperer la valeur qui value d'ou le print
                                        print(value);
                                      },
                                    ),
                                  ),
                                ),
                                Checkbox(
                                    value: produits[index].valeurBool,
                                    onChanged: (value) {
                                      setState(() {
                                        produits[index].valeurBool = value!;
                                      });
                                      if (value == true) {
                                        fonctionAddition();
                                      } else {
                                        fonctionSoustraction();
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.40,
                crossAxisCount: 2,
              ),
            ),
            //   },
            //   future: DefaultAssetBundle.of(context)
            //       .loadString("assets/ListeProduits.json"),
            // ),
          ),
        ],
      ),
    );
  }
}
