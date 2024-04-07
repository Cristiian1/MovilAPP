import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(255, 11, 76, 216),
              ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              " Profesionales",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                 color: Color(0xFF475269),
              ),
            ),
          ),
          Spacer(),
          Icon(
            CupertinoIcons.mail,
            size: 30,
            color: Color(0xFF475269),
            ),

        ],
      ),
    );
  }
}
