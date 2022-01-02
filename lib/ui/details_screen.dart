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
      this.updatedAt);

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
          Text(widget.name),
          Text(widget.category.toString())
        ],
      ),
    );
  }
}
