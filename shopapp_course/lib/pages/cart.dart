import 'package:flutter/material.dart';
import 'package:shopapp_course/components/cart_products.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: CartProducts(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Total:'),
                subtitle: Text('\$230', style: TextStyle(color: Colors.green[700]),),
              ),
            ),

            Expanded(
              child: MaterialButton(
                onPressed: (){},
                child: Text('Checkout', style: TextStyle(color: Colors.white),),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
