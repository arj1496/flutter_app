import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstScreen extends StatelessWidget {
   List<String> product = ["Marathi","Hindi","English"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: product.length,
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[

          Text(product[index], style: TextStyle(color: Colors.deepPurple))
        ],
      ),
    );
  }

}