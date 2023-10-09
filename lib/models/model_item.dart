import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  late String title;
  late String author;
  late String category;
  late String content;
  late String imageUrl;
  late int price;
  late String publisher;
  late int starRating;
  late String id;


  Item({
    required this.title,
    required this.author,
    required this.category,
    required this.content,
    required this.imageUrl,
    required this.price,
    required this.publisher,
    required this.starRating,
    required this.id,
});

  Item.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    title = data['title'].toString();
    author = data['author'].toString();
    category = data['category'].toString();
    content = data['content'].toString();
    imageUrl = data['imageUrl'].toString();
    price = data['price'].toInt();
    publisher = data['publisher'].toString();
    starRating = data['starRating'].toInt();
  }

  Item.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    author = data['author'];
    category = data['category'];
    content = data['content'];
    imageUrl = data['imageUrl'];
    price = data['price'];
    publisher = data['publisher'];
    starRating = data['starRating'];
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'content': content,
      'imageUrl': imageUrl,
      'price': price,
      'publisher': publisher,
      'starRating': starRating,
    };
  }
}