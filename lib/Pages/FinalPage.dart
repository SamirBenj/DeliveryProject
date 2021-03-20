import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({Key key}) : super(key: key);

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/commande.png"),
            Text(
              'La commande est envoyé !',
              style: GoogleFonts.montserrat(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Elle vous attendra à la fin\n de votre cours !',
              maxLines: 2,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Text(
              'Solde CROUS restant:19.50 €',
              maxLines: 2,
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
