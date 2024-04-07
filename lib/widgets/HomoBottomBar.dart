import 'package:flutter/material.dart';
import 'package:psicolbienestar/pages/TareaCategoriaPage.dart';

class HomoBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 5, 15, 143),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/");
            },
          
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 32,
          ),
          ),
           Icon(
            Icons.person,
            color: Colors.white,
            size: 32,
          ),
          
           Icon(
            Icons.list,
            color: Colors.white,
            size: 32,
            
          ),
          InkWell(
            onTap: (){
             Navigator.pushNamed(context, "tareaPage");
            },
          child:Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    ),

    );
  }
}