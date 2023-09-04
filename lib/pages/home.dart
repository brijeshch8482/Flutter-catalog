import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import '../models/catalog.dart';
import '../widgets/home_widegts/catalog_header.dart';
import '../widgets/home_widegts/catalog_list.dart';

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






