import 'package:flutter/material.dart';
import 'package:projet_food/Classes/produit.dart';
import 'CommandePage.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({Key? key, this.panierInfo}) : super(key: key);
  final panierInfo;
  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  int somme = 0;

  @override
  Widget build(BuildContext context) {
    num sommePanier = 0;
    for (int i = 0; i < widget.panierInfo.length; i++) {
      sommePanier = sommePanier + widget.panierInfo.toList()[i].prix;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panier',
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
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: widget.panierInfo.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          width: 100,
                          image: AssetImage(
                            widget.panierInfo.toList()[index].imageProduit,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.panierInfo.toList()[index].description,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.panierInfo.toList()[index].nomProduit,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.panierInfo.toList()[index].prix.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text(sommePanier.toString()),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CommandePage()));
            },
            child: Text('Commander'),
          ),
        ],
      ),
    );
  }
}
