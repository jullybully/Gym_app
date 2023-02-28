import 'package:flutter/material.dart';
import '../components/productview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prepare your body for summer')),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Text(
            'Nemokamas pristatymas į Lietuvą, išleidus 50€',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search yours protein',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ProductView(
                imageProduct: 'assets/images/protein.png',
                nameProduct: 'Whey Gold',
                priceProduct: '79.30',
              ),
              ProductView(
                imageProduct: 'assets/images/protein2.png',
                nameProduct: 'Amix',
                priceProduct: '86.00',
              ),
              ProductView(
                imageProduct: 'assets/images/protein3.png',
                nameProduct: 'XXL Nutrition',
                priceProduct: '88.0',
              ),
              ProductView(
                imageProduct: 'assets/images/protein4.png',
                nameProduct: 'MyProtein Impact',
                priceProduct: '66.56',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
