import 'package:flutter/material.dart';
import 'detail_produk.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      fontFamily: 'Roboto', // Menggunakan font Roboto
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  List<String> _categories = ['All', 'Jordan', 'Football', 'Sneakers', 'Basketball'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Shoes",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildCategoryRow(),
            SizedBox(height: 30),
            _buildShoeItem(
              image: 'assets/images/satu.jpg',
              tag: 'red',
              context: context,
              title: 'Football Shoes',
              brand: 'Nike',
              price: 'Rp.1,700,000',
            ),
            _buildShoeItem(
              image: 'assets/images/dua.jpg',
              tag: 'blue',
              context: context,
              title: 'Sneakers Air Jordan',
              brand: 'Nike',
              price: 'Rp.2,199,000',
            ),
            _buildShoeItem(
              image: 'assets/images/tiga.jpg',
              tag: 'white',
              context: context,
              title: 'Running Shoes',
              brand: 'Nike',
              price: 'Rp.1,400,000',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                _categories[index],
                style: TextStyle(
                  fontSize: 17,
                  color: _selectedCategoryIndex == index ? Colors.black : Colors.grey,
                  fontWeight: _selectedCategoryIndex == index ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShoeItem({
    required String image,
    required String tag,
    required BuildContext context,
    required String title,
    required String brand,
    required String price,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoesDetail(image: image, tag: tag, title: title, brand: brand, price: price)),
        );
      },
      child: Container(
        height: 250,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 30,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    brand,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                price,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
