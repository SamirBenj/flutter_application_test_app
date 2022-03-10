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
            if (widget.produitList[index].categorie == "burger") {
              print("jjsjj");
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
                                        value: true,
                                        onChanged: (value) {
                                          // setState(() {
                                          //   _valueSelected != value;
                                          // });
                                          // //recuperer la valeur qui value d'ou le print
                                          // print(value);
                                        },
                                      ),
                                    ),
                                  ),
                                  Checkbox(
                                      value:
                                          widget.produitList[index].valeurBool,
                                      onChanged: (value) {
                                        //   setState(() {
                                        //     produits[index].valeurBool = value!;
                                        //   });
                                        //   if (value == true) {
                                        //     fonctionAddition();
                                        //   } else {
                                        //     fonctionSoustraction();
                                        //   }
                                        // }),
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : GestureDetector();
          },
        ));
  }
}
