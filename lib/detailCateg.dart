import 'package:flutter/material.dart';

class DetailCateg extends StatefulWidget {
  DetailCateg({Key? key, required this.nomCateg, required this.produitList})
      : super(key: key);
  final nomCateg;
  final produitList;
  @override
  State<DetailCateg> createState() => _DetailCategState();
}

class _DetailCategState extends State<DetailCateg> {
  late bool testShowWidget = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.nomCateg),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: widget.produitList.length,
          itemBuilder: (BuildContext context, int index) {
            print(widget.produitList[index].prix.toString());
            if (widget.produitList[index].categorie ==
                widget.nomCateg.toString().toLowerCase()) {
              testShowWidget = true;
            } else {
              testShowWidget = false;
            }
            return testShowWidget
                ? Padding(
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
                              '${widget.produitList[index].imageProduit}',
                              height: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.produitList[index].nomProduit
                                        .toString(),
                                  ),
                                  Text(
                                    '${widget.produitList[index].prix}' + '€',
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '${widget.produitList[index].description}',
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Text('yes');
          },
        ));
  }
}
