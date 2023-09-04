import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import '../models/catalog.dart';

class HomeDetailsPage extends StatelessWidget{
  const HomeDetailsPage({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.white,),

      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Column(

          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Hero(
                tag: catalog.id.toString(),
                  child: Image.network(catalog.image)
              ),
            ),
            Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(90, 90)
                    ),

                  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(catalog.name, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyTheme.darkBlueColor,
                          fontSize: 28,
                        ),
                        ),

                        Text(catalog.desc, style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: MyTheme.darkBlueColor,
                          fontSize: 18,
                        ),
                            textAlign: TextAlign.center
                        ),

                      ],

                    )
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("\$${catalog.price}", style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF944343)
              ),),

              SizedBox(
                width: 90,
                height: 40,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueColor),
                        shape: MaterialStateProperty.all(const StadiumBorder(),)

                    ),
                    child: const Text("Buy")),
              )

            ],
    ),
      ),

    );
  }

}