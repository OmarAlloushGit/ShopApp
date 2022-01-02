import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled11/apis/apis.dart';

class AddProductScreen extends StatefulWidget {
  String token;
  AddProductScreen(this.token);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  PickedFile? file;
  var addNameController = TextEditingController();

  var addImageController = TextEditingController();

  var addDateController = TextEditingController();

  var addCategoriesController = TextEditingController();

  var addPhoneController = TextEditingController();

  var addQuantityController = TextEditingController();

  var addPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddProduct'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: addNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter product name ',
                  prefixIcon: Icon(
                    Icons.menu,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: addImageController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Select image ',
                  prefixIcon: Icon(
                    Icons.image,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: addDateController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Exp_Date',
                  prefixIcon: Icon(
                    Icons.menu,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: addCategoriesController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Categories ',
                  prefixIcon: Icon(
                    Icons.menu,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: addPhoneController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter phone number ',
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: addQuantityController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'quantity',
                  prefixIcon: Icon(
                    Icons.menu,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: addPriceController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Price ',
                  prefixIcon: Icon(
                    Icons.money,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(onPressed: () {

                print(widget.token.split("\"")[1]);
                apiProvider.addProductApi(
                    addNameController.text, Image.file(File(file!.path)).toString(),
                    addDateController.text,
                    addCategoriesController.text,
                    addQuantityController.text,
                    addPriceController.text,widget.token.split("\"")[1]);
              }, child: Text('Send')),
              TextButton(onPressed: () async{
                file= await ImagePicker.platform.pickImage(source: ImageSource.gallery);
               file?.readAsBytes().then((value) {
                 print(value);
               });
              }, child: Text('pick')),
            ],
          ),
        ),
      ),
    );
  }
}
