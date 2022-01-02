//import 'dart:html';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:untitled11/bloc/search_bloc.dart';
import 'package:untitled11/helper/connect_screen.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  int val = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SearchScreen',
        ),
        leading: IconButton(
          onPressed: () {
            linkingScreen.goBack(context);
          },
          icon: const CircleAvatar(
              radius: 17.0,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Search ',
                prefixIcon: Icon(
                  Icons.search,
                ),
                suffix: IconButton(
                    onPressed: () {






                    },
                    icon: Icon(
                      Icons.eleven_mp,
                      color: Colors.deepOrange,

                    )),
                border: OutlineInputBorder(),
              ),
            ),

            Expanded(
                child: StreamBuilder<List?>(
                    stream: searchBloc.product,
                    builder: (context, AsyncSnapshot<List?> snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                var uri = Uri.https(
                                    'cryptic-crag-48403.herokuapp.com',
                                    '/api/products/' +
                                        snapshot.data![index]['product_id']
                                            .toString());
                                final response = await http.get(uri);
                                if (response.statusCode == 200 ||
                                    response.statusCode == 201) {
                                  final result = jsonDecode(response.body);
                                  print(response.body);
                                  print("here");
                                  linkingScreen.goToNextScreen(
                                      context,
                                      DetailsScreen(
                                          result['The product']['product_id'] ??
                                              0,
                                          result['The product']['name'] ?? '',
                                          result['The product']['quantity'] ??
                                              0,
                                          result['The product']['image'] ??
                                              'nn',
                                          result['The product']['exp_date'] ??
                                              'nn',
                                          result['The product']
                                                  ['description'] ??
                                              'nnnn',
                                          result['The product']['price'] ?? 0,
                                          result['Views'],
                                          result['The product']['user_id'] ??
                                              98,
                                          result['The product']
                                                  ['category_id'] ??
                                              1,
                                          result['The product']['created_at'] ??
                                              'nn',
                                          result['The product']['updated_at'] ??
                                              'nn',
                                          result['Likes'],
                                          result['Comments'],
                                          result['The product']['current_price']
                                                  .toString() ??
                                              'No Discount'));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                height: 100,
                                width: 100,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            child: Image.network(
                                              'https://th.bing.com/th/id/R.f15177ec9b8d3fc9f16ce3a3a7b9764c?rik=nRB3pr4rvc4jsg&pid=ImgRaw&r=0',
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ))),
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 15, top: 15),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        snapshot.data![index]['name'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount (
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 20.0,
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('No internet'),
                        );
                      }
                      return const SizedBox.shrink();
                    }))
          ],
        ),
      ),
    );
  }
}
