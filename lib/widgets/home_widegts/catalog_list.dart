import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import '../../models/catalog.dart';
import '../../widgets/themes.dart';


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
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => HomeDetailsPage(
                    catalog: catalog,
                )
                )
            ),
              child: CatalogItem (catalog)
          );
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
              child: Hero(

                  tag: catalog.id.toString(),

                  child: Image.network(catalog.image)
              )
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