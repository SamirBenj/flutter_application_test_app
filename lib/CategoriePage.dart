import 'package:flutter/material.dart';
import 'package:projet_food/DetailsPage.dart';
import 'package:projet_food/detailCateg.dart';
import 'Classes/classCategorie.dart';

class CategoriePage extends StatefulWidget {
  const CategoriePage({Key? key}) : super(key: key);

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  List<Categorie> categorie = [
    Categorie("assets/burger-au-fromage.png", "Burger"),
    Categorie("assets/pizza.png", "Pizza"),
    Categorie("assets/salad.png", "Salade"),
    Categorie("assets/gaufres.png", "Gauffre"),
    Categorie("assets/cornet-de-glace.png", "Glace"),
    Categorie("assets/biscuits.png", "Cookie"),
    Categorie("assets/biscuits.png", "Acompagnement"),
    Categorie("assets/boissons-non-alcoolisees.png", "Boisson"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorie',
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
      body: Container(
        child: GridView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //recuperer la categorie
                var nomCateg = categorie[index].nom;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailCateg(
                              nomCateg: nomCateg,
                            )));
              },
              child: Card(
                elevation: 5.0,
                color: Color.fromRGBO(111, 186, 255, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        categorie[index].nom,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        height: 30,
                        indent: 100,
                        color: Colors.white,
                        endIndent: 100,
                      ),
                      Image(
                        width: 40,
                        height: 40,
                        image: AssetImage(
                          categorie[index].image,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        ),
      ),
    );
  }
}
