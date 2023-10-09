import 'package:flutter/material.dart';
import 'package:flutter_bookstore/models/model_item.dart';
import 'package:flutter_bookstore/models/model_auth.dart';
import 'package:flutter_bookstore/models/model_cart.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    final cart = Provider.of<CartProvider>(context);
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen:false);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.network(item.imageUrl),
            Padding(
                padding: EdgeInsets.all(3),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.category,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.price.toString() + '원',
                          style: TextStyle(fontSize: 18   , color: Colors.red),
                        ),
                        Text(
                          '글쓴이: ' + item.author,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '출판사: ' + item.publisher,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '평점: ' + item.starRating.toString(),
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  cart.isItemInCart(item)
                    ? Icon(Icons.check, color: Colors.blue)
                    : InkWell(
                        onTap: () {
                          cart.addItemToCart(authClient.user, item);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                            Text(
                              '담기',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(item.content, style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}