import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  ProductBox({required Key key,
    required this.name,
    required this.description,
    required this.id,
    required this.image})
      : super(key: key);
  final String name;
  final String description;
  final int id;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("/images/college.png" + image),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                  this.name,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(this.description),
                              Text("id: " + this.id.toString()),
                            ],
                          )
                      )
                  ) ]
            )
        )
    );
  }
}