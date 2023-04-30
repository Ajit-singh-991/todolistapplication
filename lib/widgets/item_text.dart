import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Just shows the text inside a ListItem.
// Show due date and due time if they exist.
//### MISSING FEATURES ###
//Code needs to be refactored.
// Treat text overflow.

class ItemText extends StatelessWidget {
  final bool check;
  final String adahr;
  final String accnt;
  final String panno;
  final String naame;

  ItemText(
    this.check, this.adahr, this.accnt, this.panno, this.naame,
  );

  Widget _buildText(BuildContext context) {
    if (check) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            accnt,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
           Text(
            adahr,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
           Text(
            panno,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
           Text(
            naame,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          adahr,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
         Text(
          accnt,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
         Text(
          panno,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
         Text(
          naame,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return _buildText(context);
    //Search if it's ok to return something like this :P
  }
}
