import 'package:flutter/material.dart';
import 'package:flutter_bookstore/models/model_item_provider.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);

    return FutureBuilder(
        future: itemProvider.fetchItems(),
        builder: (context, snapshot) {
          if(itemProvider.items.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //한줄에 함께 나와야 하는 항목의 개수
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: itemProvider.items.length,
                itemBuilder: (context, index) {
                  return GridTile(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail',
                            arguments: itemProvider.items[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                   child: Image.network(itemProvider.items[index].imageUrl,
                                          width: MediaQuery.of(context).size.width * 0.5,
                                          )

                              ),
                              Padding(padding: EdgeInsets.only(top: 3)),
                              Container(
                                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      itemProvider.items[index].title,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(itemProvider.items[index].price.toString() + '원',
                                        style: TextStyle(fontSize: 16, color: Colors.red)),
                                  ],
                                ),
                              ),

                              
                            ],
                          ),
                        ),
                      ));
                }
            );
          }
        });
  }
}