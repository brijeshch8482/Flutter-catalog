import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import '../models/catalog.dart';
import '../widgets/Drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {

    loadData();

    super.initState();
  }

  loadData() async {

    await Future.delayed(const Duration(seconds: 2)); // This is for the waiting thread

    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items = List.from(productData)
        .map((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(

          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),

              if(CatalogModel.items.isNotEmpty)
                const CatalogList()
              else
                const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                )
            ],
          ),
        ),
      ),
    );

  }
}

class CatalogHeader extends StatelessWidget{
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Catalog App",
          style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),),
        Text("Trending Products",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal
          ),),
      ],
    );
  }
}

class CatalogList extends StatelessWidget{
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            final catalog = CatalogModel.items[index];
            return CatalogItem (catalog);
        },
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem(this.catalog, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
         height: 150,
         width: 150,
         margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),

         decoration: const BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(15)),
           color: Colors.white,
         ),

         child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                height: 150,
                width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: MyTheme.creamColor,
              ),
                child: Image.network(catalog.image)
            ),
            Expanded(
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(catalog.name, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyTheme.darkBlueColor,
                    fontSize: 15,

                  ),),

                  Text(catalog.desc, style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: MyTheme.darkBlueColor,
                    fontSize: 12,
                  ),),

                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: const EdgeInsets.only(right: 8),

                    children: [
                      Text("\$${catalog.price}", style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                      ),),
                      
                      ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueColor),
                            shape: MaterialStateProperty.all(const StadiumBorder(),)

                          ),
                          child: Text("Buy"))

                    ],
                  )
                ],

            ))

          ],
        ),

      );
  }
}
