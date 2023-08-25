import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    await Future.delayed(Duration(seconds: 2)); // This is for the waiting thread

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

      appBar: AppBar(
        title: Text("Catalog app"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context,index){
              return ItemWidget(
                item: CatalogModel.items[index],
              );
          }

        )
        : Center(
          child: CircularProgressIndicator(),
    ),

      ),

      drawer: MyDrawer(),

    );

  }
}
