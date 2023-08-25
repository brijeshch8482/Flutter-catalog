import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReJ3Xq23aE2UOwHTEd6TbM_pBhe8mgSbrYaA";


    return Drawer(

      width: MediaQuery.of(context).size.width*0.75,

      child: Container(

        color: Colors.deepPurple,

        child: ListView(

          children: [

            DrawerHeader(

              padding: EdgeInsets.zero,

              child: UserAccountsDrawerHeader(

                margin: EdgeInsets.zero,

                accountName: Text("Brijesh Chaudhary"),
                accountEmail: Text("chaudhryji8482@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),

                ),
              ),
            ),
            ListTile(

              leading: Icon(

                CupertinoIcons.home,
                color: Colors.white,
              ),

              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ),
            ListTile(

              leading: Icon(

                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),

              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ),
            ListTile(

              leading: Icon(

                CupertinoIcons.mail,
                color: Colors.white,
              ),

              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}