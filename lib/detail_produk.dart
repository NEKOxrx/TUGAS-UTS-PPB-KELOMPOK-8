import 'package:flutter/material.dart';

class ShoesDetail extends StatefulWidget {
  final String image;
  final String tag;
  final String title;
  final String brand;
  final String price;

  const ShoesDetail({Key? key, required this.image, required this.tag, required this.title, required this.brand, required this.price}) : super(key: key);

  @override
  _ShoesDetailState createState() => _ShoesDetailState();
}

class _ShoesDetailState extends State<ShoesDetail> {
  void addToCart(BuildContext context) {
    List<String> shoppingCart = [];
    shoppingCart.add(widget.title);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item added to cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: widget.tag,
              child: InteractiveViewer(
                boundaryMargin: EdgeInsets.all(20),
                minScale: 0.1,
                maxScale: 3.0,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.brand,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  widget.price,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    addToCart(context);
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}