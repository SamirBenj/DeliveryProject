import 'package:delivery_crous/Pages/DescriptionPage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FoodCardDesign extends StatefulWidget {
  final Function changeData;
  final bool valeurExt;
  final bool salut;
  final String nomProduit;
  final int prix;
  final String image;
  final String description;
  const FoodCardDesign({
    Key key,
    this.nomProduit,
    this.prix,
    this.changeData,
    this.valeurExt,
    this.salut,
    this.image,
    this.description,
  }) : super(key: key);
  @override
  _FoodCardDesignState createState() => _FoodCardDesignState();
}

class _FoodCardDesignState extends State<FoodCardDesign> {
  //final ValueSetter<Product> valueSetter;
  //List<Product> product;
  //_FoodCardDesignState(this.valueSetter);

  checkedSelected() {
    setState(() {
      val = true;
      if (val != true) {}
    });
  }

  bool val = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DescriptionsPage(
                      nomProduit: widget.nomProduit,
                      imageProduit: widget.image,
                      description: widget.description,
                      valeurBool: widget.salut,
                    )));
      },
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset(
              widget.image,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nomProduit,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    widget.prix.toString() + '€',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10, bottom: 5),
                child: Text(
                  widget.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ),
            Align(
              child: Checkbox(
                hoverColor: Colors.amberAccent,
                activeColor: HexColor('E33620'),
                value: widget.salut,
                onChanged: widget.changeData,
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }
}
