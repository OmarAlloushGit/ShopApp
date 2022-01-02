import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  int productId;
  String name;
  int quantity;
  String imageUrl;
  String expDate;
  String description;
  int price;
  int views;
  int userId;
  int category;
  String createdAt;
  String updatedAt;
  int Likes , comment ;
  String currentPrice;


  DetailsScreen(
      this.productId,
      this.name,
      this.quantity,
      this.imageUrl,
      this.expDate,
      this.description,
      this.price,
      this.views,
      this.userId,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.Likes,
      this.comment,
     this.currentPrice,

      );

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'details',
        ),
      ),
      body: ListView(
        children: [
          Text(widget.imageUrl.toString()),
          Text(widget.productId.toString()),
          Text(widget.name.toString()),
          Text(widget.quantity.toString()),
          Text(widget.category.toString()),
          Text(widget.expDate.toString()),
          Text(widget.updatedAt.toString()),
          Text(widget.createdAt.toString()),
          Text("Price "+widget.price.toString()),
          Text(widget.description.toString()),
          Text("Number of Views: "+widget.views.toString()),
          Text("User ID: " +widget.userId.toString()),
          Text("Number of Likes: " +widget.Likes.toString()),
          Text("Number of Comments: "+ widget.comment.toString()),
         Text("Current Price: "+widget.currentPrice.toString()),

        ],
      ),
    );
  }
}
