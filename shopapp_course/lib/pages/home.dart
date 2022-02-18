import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//My own imports
import 'package:shopapp_course/components/horizontal_listview.dart';
import 'package:shopapp_course/components/products.dart';
import 'package:shopapp_course/pages/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
        height: 200.0,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/c1.jpg'),
            AssetImage('images/m1.jpeg'),
            AssetImage('images/m2.jpg'),
            AssetImage('images/w1.jpeg'),
            AssetImage('images/w3.jpeg'),
            AssetImage('images/w4.jpeg'),
          ],
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          indicatorBgPadding: 4.0,
          dotBgColor: Colors.transparent,
        ));

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('Fashion Shop'),
        centerTitle: false,
        backgroundColor: Colors.red[500],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              // Header
              UserAccountsDrawerHeader(
                accountEmail: Text('Salatyelll14@gmail.com'),
                accountName: Text('Prince Salatyell'),
                currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.person, color: Colors.white, size: 50.0),
                    )),
                decoration: BoxDecoration(color: Colors.red[800]),
              ),
              // Body

              InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Home Page'),
                    leading: Icon(Icons.home, color: Colors.red[300])),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('My account'),
                    leading: Icon(Icons.person, color: Colors.red[300])),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('My orders'),
                    leading: Icon(Icons.shopping_basket, color: Colors.red[300])),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: ListTile(
                    title: Text('Shopping cart'),
                    leading: Icon(Icons.shopping_cart, color: Colors.red[300])),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(Icons.favorite, color: Colors.red[300])),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings, color: Colors.blueGrey[300])),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.help, color: Colors.blue)),
              ),
            ],
          )),
      body: Column(
        children: [
          //carousel
          image_carousel,

          //padding widget
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.5)),
          ),

          // horizontal list view
          HorizontalList(),

          //padding widget
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Recent Products',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.5)),
          ),

          //Grid view
          Flexible(child: Products()),
        ],
      ),
    );
  }
}