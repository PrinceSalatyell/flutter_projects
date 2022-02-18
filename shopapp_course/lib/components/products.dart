import 'package:flutter/material.dart';
import 'package:shopapp_course/pages/product_details.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Male Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Female Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 130,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 150,
      "price": 75,
    },
    {
      "name": "Violet Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 110,
      "price": 69.99,
    },
    {
      "name": "Red Heels",
      "picture": "images/products/hills2.jpeg",
      "old_price": 115,
      "price": 69.99,
    },
    {
      "name": "Black SweatPants",
      "picture": "images/products/pants1.jpg",
      "old_price": 20,
      "price": 9,
    },
    {
      "name": "Grey SweatPants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 20,
      "price": 9,
    },
    {
      "name": "Designer Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": 200,
      "price": 99,
    },
    {
      "name": "Blue Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 60,
      "price": 39.99,
    },
    {
      "name": "pink Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 50,
      "price": 29.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProd(
                prodName: product_list[index]['name'],
                prodPicture: product_list[index]['picture'],
                prodOldPrice: product_list[index]['old_price'],
                prodPrice: product_list[index]['price']),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  const SingleProd(
      {required this.prodName,
      required this.prodPicture,
      required this.prodOldPrice,
      required this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      // passing the values of the prod to the ProductDetails class
                      prodDetailName: prodName,
                      prodDetailPicture: prodPicture,
                      prodDetailOldPrice: prodOldPrice,
                      prodDetailPrice: prodPrice,
                    ))),
            child: GridTile(
              footer: Container(
                  color: Colors.redAccent[100],
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          prodName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Text(
                        '\$$prodPrice',
                        style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              child: Image.asset(
                prodPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
