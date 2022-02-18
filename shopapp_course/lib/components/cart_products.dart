import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "name": "Male Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 1
    },
    {
      "name": "Female Blazer",
      "picture": "images/products/blazer2.jpeg",
      "price": 85,
      "size": "S",
      "color": "Black",
      "quantity": 1
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "size": "S",
      "color": "Red",
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsOnTheCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProdName: productsOnTheCart[index]['name'],
            cartProdPicture: productsOnTheCart[index]['picture'],
            cartProdPrice: productsOnTheCart[index]['price'],
            cartProdSize: productsOnTheCart[index]['size'],
            cartProdColor: productsOnTheCart[index]['color'],
            cartProdQty: productsOnTheCart[index]['quantity'],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  final cartProdQty;

  const SingleCartProduct({
    required this.cartProdName,
    required this.cartProdPicture,
    required this.cartProdPrice,
    required this.cartProdSize,
    required this.cartProdColor,
    required this.cartProdQty
});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        // ========= LEADING SECTION ========
        leading: Image.asset(
          cartProdPicture,
          width: 80.0,
          height: 80.0,
        ),

        // ======== TITLE SECTION ========
        title: Text(cartProdName),

          // ======== SUBTITLE SECTION ========
        subtitle: Column(
          children: [
            //  ROW INSIDE COLUMN
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text('Size:   '),
                      Text(
                        cartProdSize,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text('Color:   '),
                      Text(
                        cartProdColor,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // ======== THIS SECTION IS FOR THE PRODUCT PRICE ========
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                  '\$$cartProdPrice',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700]
                ),
              ),
            )
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: IconButton(
                padding: EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
                  onPressed: (){},
                  icon: Icon(Icons.arrow_drop_up),
              ),
            ),
            Expanded(child: Text('$cartProdQty', style: TextStyle(fontSize: 15.0)),),
            Expanded(
              child: IconButton(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                onPressed: (){},
                icon: Icon(Icons.arrow_drop_down),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

