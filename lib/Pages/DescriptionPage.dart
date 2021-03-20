import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../ListProducts.dart';

class DescriptionsPage extends StatefulWidget {
  final String nomProduit;
  final String imageProduit;
  final int prixProduit;
  final String description;
  bool valeurBool;
  DescriptionsPage(
      {Key key,
      this.nomProduit,
      this.imageProduit,
      this.prixProduit,
      this.description,
      this.valeurBool})
      : super(key: key);

  @override
  _DescriptionsPageState createState() => _DescriptionsPageState();
}

class _DescriptionsPageState extends State<DescriptionsPage> {
  int sommePanier = 0;
  List<Product> products;
  bool selectDeselect = false;

  fonctionSomme() {
    sommePanier++;
  }

  fonctionSommeSous(bool sel) {
    sommePanier--;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Delivecrous',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: HexColor('#FDF7EF'),
        elevation: 0.0,
        toolbarHeight: height * 0.10,
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 15, end: 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 40,
                ),
                color: HexColor('130B11'),
                onPressed: () {},
                /* onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPage(
                                sommePanier: sommePanier,
                                selectedProducts: selectedProducts,
                              )));
                },*/
              ),
            ),
            badgeContent: Text(
              //sommePanier.toString(),
              '',
              style: TextStyle(color: Colors.white),
            ),
            badgeColor: HexColor('E33620'),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(child: Image.asset(widget.imageProduit.toString())),
          Flexible(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  //Text(widget.nomProduit),
                  Flexible(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.nomProduit,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          widget.description,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        Checkbox(
                          value: widget.valeurBool,
                          onChanged: (bool value) {
                            setState(() {
                              widget.valeurBool = value;
                            });

                            if (widget.valeurBool != true) {
                              print('selectionner');
                              fonctionSomme();
                              print(sommePanier.toString());
                            } else {
                              print('deselectionner');
                              fonctionSommeSous(selectDeselect);
                              print(sommePanier);
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
