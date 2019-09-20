import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstScreen extends StatelessWidget {
   List<String> product = ['Albania', 'Andorra', 'Armenia', 'Austria',
     'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
     'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
     'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
     'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
     'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
     'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
     'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
     'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];
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