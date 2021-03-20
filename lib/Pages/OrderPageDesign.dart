import 'package:flutter/material.dart';

class OrderPageDesign extends StatefulWidget {
  final String orderText;
  final orderImage;
  OrderPageDesign({Key key, this.orderText, this.orderImage}) : super(key: key);

  @override
  _OrderPageDesignState createState() => _OrderPageDesignState();
}

class _OrderPageDesignState extends State<OrderPageDesign> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Card(
        elevation: 0.0,
        child: Container(
          width: width / 2,
          child: Card(
            child: Column(
              children: [
                //Image.asset(),
                widget.orderImage,
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.orderText,
                        //widget.nomProduit,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        '',
                        // widget.prix.toString() + '€',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10, bottom: 5),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
