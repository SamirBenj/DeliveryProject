import 'package:badges/badges.dart';
import 'package:delivery_crous/Card_Items_Design.dart';
import 'package:delivery_crous/Pages/Order.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'ListProducts.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key key}) : super(key: key);

  @override
  _TestHomePageState createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {
  int sommePanier = 0;

  List<Product> products = [
    Product("Hamburger", 10, "assets/hamburger_1.jpg", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    Product("Sushi", 15, "assets/sushi.jpg", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    Product("Pizza", 12, "assets/pizza.jpg", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    Product("BurgerKing", 8, "assets/burgerKing.jpg", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    Product("Tiramisu", 10, "assets/tiramisu.jpg", false,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
  ];
  bool selectDeselect = false;

  fonctionSomme() {
    sommePanier++;
  }

  fonctionSommeSous(bool sel) {
    sommePanier--;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var selectedProducts = products.where((element) => element.valeurBool);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPage(
                                sommePanier: sommePanier,
                                selectedProducts: selectedProducts,
                              )));
                },
              ),
            ),
            badgeContent: Text(
              sommePanier.toString(),
              style: TextStyle(color: Colors.white),
            ),
            badgeColor: HexColor('E33620'),
          ),
        ],
        leading: InkWell(
          child: Icon(
            Icons.swap_horiz_sharp,
            size: 35,
            color: Colors.black,
          ),
          onTap: () {
            Get.isDarkMode
                ? Get.changeTheme(ThemeData.light())
                : Get.changeTheme(ThemeData.dark());
            //  OutlinedButton(
            //onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("I'm working on it !! ça arrive !"),
              ),
            );

            const Text('Show SnackBar');

            //},
            //  );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              children: [
                Text(
                  'La carte',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Flexible(
            child: GridView.count(
              childAspectRatio: MediaQuery.of(context).devicePixelRatio * 0.30,
              crossAxisCount: 2,
              children: List.generate(products.length, (index) {
                var sum = 0;

                bool salut = products[index].valeurBool;
                return FoodCardDesign(
                  description: products[index].description.toString(),
                  nomProduit: products[index].nomProduit,
                  prix: products[index].prix,
                  image: products[index].imageProduit,
                  salut: salut,
                  changeData: (bool value) {
                    setState(() {
                      print(products[index].prix);
                      //valeur booleen selectionner par l'utilisateur
                      products[index].valeurBool = value;

                      if (salut != true) {
                        print('selectionner');
                        fonctionSomme();
                        print(sommePanier.toString());
                      } else {
                        print('deselectionner');
                        fonctionSommeSous(selectDeselect);
                        print(sommePanier);
                      }
                      //if (salut != true) {}
                    });
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
