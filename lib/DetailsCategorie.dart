import 'package:flutter/material.dart';

class DetailsCategoriePage extends StatefulWidget {
  const DetailsCategoriePage({Key? key}) : super(key: key);

  @override
  State<DetailsCategoriePage> createState() => _DetailsCategoriePageState();
}

class _DetailsCategoriePageState extends State<DetailsCategoriePage> {
  @override
  Widget build(BuildContext context) {
    appBar:
    AppBar(
      title: Text(
        'Details',
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
    );
    return Scaffold();
  }
}
