import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final prodDetailName;
  final prodDetailPicture;
  final prodDetailOldPrice;
  final prodDetailPrice;

  const ProductDetails(
      {required this.prodDetailName,
      required this.prodDetailPicture,
      required this.prodDetailOldPrice,
      required this.prodDetailPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text('Fashion Shop'),
        ),
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
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.prodDetailPicture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.prodDetailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "\$${widget.prodDetailOldPrice}",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.prodDetailPrice}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ======= THE FIRST BUTTONS =======

          Row(children: [
            // ======= THE SIZE BUTTON =======
            Expanded(
                child: MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Size'),
                        content: Text('Choose the size:'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              'close',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: [
                  Expanded(child: Text('Size')),
                  Expanded(child: Icon(Icons.arrow_drop_down)),
                ],
              ),
            )),

            // ======= THE COLOR BUTTON =======

            Expanded(
                child: MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Color'),
                        content: Text('Choose the Color:'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              'close',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: [
                  Expanded(child: Text('Color')),
                  Expanded(child: Icon(Icons.arrow_drop_down)),
                ],
              ),
            )),

            // ======= THE QUANTITY BUTTON =======

            Expanded(
                child: MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Quantity'),
                        content: Text('Choose the amount:'),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Text(
                              'close',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: [
                  Expanded(child: Text('Qty')),
                  Expanded(child: Icon(Icons.arrow_drop_down)),
                ],
              ),
            )),
          ]),

          // ======= THE SECOND BUTTONS =======

          Row(children: [
            // ======= THE SIZE BUTTON =======
            Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text('Buy Now'))),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
              color: Colors.red,
            ),
          ]),
          Divider(
            color: Colors.blue[700],
          ),
          ListTile(
            title: Text('Product details'),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(
            color: Colors.blue[700],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.prodDetailName),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Brand X"),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("NEW"),
              ),
            ],
          ),
          Divider(
            color: Colors.blue[700],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Products',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.5)),
          ),
          Container(height: 340.0, child: SimilarProducts()),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProd(
              prodName: product_list[index]['name'],
              prodPicture: product_list[index]['picture'],
              prodOldPrice: product_list[index]['old_price'],
              prodPrice: product_list[index]['price']);
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  const SimilarSingleProd(
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
