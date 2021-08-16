import 'package:flutter/material.dart';
import 'package:magazine_luiza/models/product.dart';
import 'package:magazine_luiza/provider/list_of_products.dart';

class Offer extends StatefulWidget {
  @override
  createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/logo.jpg"),
          title: Text("Ofertas do dia"),
          bottom: PreferredSize(
            child: Image.asset("assets/linha.jpg"),
            preferredSize: Size(300, 0),
          ),
        ),
        body: ListView.separated(
            itemBuilder: builder,
            itemCount: 7,
            separatorBuilder: (_, index) {
              return Divider();
            }));
  }

  Widget builder(BuildContext _, int index) {
    Product _product = listOfProducts.elementAt(index);
    return ListTile(
      leading: Image.asset(
        _product.photo,
      ),
      trailing: IconButton(icon:(_product.isFavorite) 
            ? Icon(
                Icons.favorite_border,
                color: Colors.pink,
              )
            : Icon(
                Icons.favorite_outlined,
                color: Colors.pink,
              ),
        onPressed: () {
          setState(() {
            _product.isFavorite = !_product.isFavorite;
          });
        },
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _product.name,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _product.description,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _product.price,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _product.offerDay,
                style: TextStyle(fontSize: 10, color: Colors.blue),
              ),
            ],
          )
        ],
      ),
    );
  }
}
