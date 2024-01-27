import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext acontext) {
    return MaterialApp(
      home: ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: ListView(
        children: [
          ProductCard('iphone 15 pro', 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15-pro.jpg', '171500', 'Titanium.So strong.So light.So Pro'),
          ProductCard('iPhone 15', 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15.jpg', '115000', 'New Dynamic Island'),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final String description;

  ProductCard(this.name, this.image, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(image),
          ListTile(
            title: Text(name),
            subtitle: Text('Price: $price\nDescription: $description'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuyNowPage()),
              );
            },
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Choose Payment Method:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaymentButton('BKash', 'https://www.logodee.com/wp-content/uploads/2021/10/25.jpg'),
              PaymentButton('Rocket', 'https://adsofbd.com/wp-content/uploads/2019/06/DBBL-Rocket-Vector-Logo.jpg'),
              PaymentButton('Visa', 'https://thumbs.dreamstime.com/b/web-183282979.jpg'),
              //PaymentButton('Mastercard', 'https://marvel-b1-cdn.bc0a.com/f00000000163918/www.care.org/wp-content/uploads/2020/09/Mastercard-Logo-2.jpg'),
              //PaymentButton('AmEx', 'https://seeklogo.com/images/A/american-express-logo-EDF87C04A0-seeklogo.com.png'),
            ],
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            items: ['BKash', 'Rocket', 'Visa','Mastercarrd','AmEx'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              //dropdown value
            },
            hint: Text('Select an option'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String name;
  final String image;

  PaymentButton(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle payment method selection
      },
      child: Column(
        children: [
          Image.network(image, height: 50, width: 50),
          Text(name),
        ],
      ),
    );
  }
}
