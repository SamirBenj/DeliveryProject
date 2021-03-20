import 'package:badges/badges.dart';
import 'package:delivery_crous/Pages/FinalPage.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderPage extends StatelessWidget {
  final int sommePanier;
  final selectedProducts;
  const OrderPage({
    Key key,
    this.sommePanier,
    this.selectedProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
              ),
            ),
            badgeContent: Text(
              sommePanier.toString(),
              style: TextStyle(color: Colors.white),
            ),
            badgeColor: HexColor('E33620'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Row(
              children: [
                Text(
                  'Panier',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: selectedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                //print(selectedProducts.toList()[index].prix);

                var sum = 0;
                //selectedProducts.toList()[index].prix.forEach((e) => sum += e);
                print(sum);
                return Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        selectedProducts.toList()[index].imageProduit,
                        width: 185,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            //totalOrder =
                            //int.parse(selectedProducts.toList()[index].prix) +
                            //int.parse(totalOrder.toString()),
                            Text(
                              selectedProducts.toList()[index].nomProduit,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              selectedProducts.toList()[index].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Text(
            'Prix Total :',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: HexColor('#713335'),
                //onPrimary: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinalPage(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Passer La Commande',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
