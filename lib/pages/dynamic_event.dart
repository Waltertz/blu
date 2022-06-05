import 'package:flutter/material.dart';

//homepage
void main() => runApp(MyApp());
class Homepage {
  final String name;
  final String description;
  final int price;
  final String image;
  Homepage(this.name,
      this.description,
      this.price, this.image);
  static List<Homepage> getHomepage() {
    List<Homepage> items = <Homepage>[];
    items.add(Homepage( "course", "Pixel is the most featureful phone ever", 800, "pixel.png"));
    items.add(Homepage("year", "Laptop is most productive development tool", 2000, "laptop.png"));
    items.add(Homepage( "calendar", "Tablet is the most useful device ever for meeting", 1500, "tablet.png"));
    items.add(Homepage( "timetable", "iPhone is the stylist phone ever", 100, "pendrive.png"));
    items.add(Homepage( "attendance", "iPhone is the stylist phone ever", 20, "floppy.png"));
    items.add(Homepage( "report", "iPhone is the stylist phone ever", 1000, "iphone.png"));
    return items;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override Widget build(BuildContext context) {
    return MaterialApp( title: 'Amis',
      theme: ThemeData( primarySwatch: Colors.blue, ),
      home: MyHomePage(title: 'Amis Navigation homepage page'), );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Homepage.getHomepage();
  @override Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text("Amis Navigation")),
        body: ListView.builder( itemCount: items.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            child: HomepageBox(item: items[index]),
            onTap: () {
              Navigator.push( context,
                MaterialPageRoute( builder: (context) =>
                    HomePage(item: items[index]),
              ),
              );
              },
          );
          },
        )
    );
  }
}
class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.item}) : super(key: key);
  final Homepage item;
  @override Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(


  title: Text(this.item.name), ),
      body: Center(
        child: Container( padding: EdgeInsets.all(0),
          child: Column( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/appimages/" + this.item.image),
                Expanded( child: Container( padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.item.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.item.description),
                        Text("Price: " + this.item.price.toString()),
                        RatingBox(),
                      ],
                    ))
                )
              ]
          ),
        ),
      ),
    );
  }
}
class RatingBox extends StatefulWidget {
  @override _RatingBoxState createState() => _RatingBoxState();
}
class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() { setState(() { _rating = 1;
  }
  );
  }
  void _setRatingAsTwo() {
    setState(() { _rating = 2;
    }
    );
  }
  void _setRatingAsThree() { setState(() {


  _rating = 3;
  }
  );
  }
  Widget build(BuildContext context) { double _size = 20;
    print(_rating);
    return Row( mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container( padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1 ? Icon( Icons.star, size: _size, ):
            Icon( Icons.star_border, size: _size, )
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container( padding: EdgeInsets.all(0),
          child: IconButton( icon: (_rating >= 2 ? Icon( Icons.star, size: _size,
          ) : Icon( Icons.star_border, size: _size, )),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,),
        ),
        Container( padding: EdgeInsets.all(0),
          child: IconButton( icon: (_rating >= 3 ? Icon( Icons.star, size: _size, )

    : Icon( Icons.star_border, size: _size, )),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}
class HomepageBox extends StatelessWidget {
  HomepageBox({Key? key, required this.item}) : super(key: key);
  final Homepage item;
  Widget build(BuildContext context) {
    return Container( padding: EdgeInsets.all(2),
    height: 140,
    child: Card(
    child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Image.asset("assets/appimages/" + this.item.image),
    Expanded( child: Container( padding: EdgeInsets.all(5),
    child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(this.item.name,
      style: TextStyle(fontWeight: FontWeight.bold)),

    Text(this.item.description),
    Text("Price: " + this.item.price.toString()),
    RatingBox(),
    ],
    )
    )
    )
    ]
    ),

  ));
  }
}