//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:untitled11/bloc/search_bloc.dart';
import 'package:untitled11/helper/connect_screen.dart';

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
            linkingScreen.goBack(
                context);
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
                border: OutlineInputBorder(),
              ),
            ),
            NumberPicker(
              value: val,
              minValue: 0,
              maxValue: 100000,
              onChanged: (value) {
                setState(() => val = value);
              },
            ),
            Expanded(child: StreamBuilder<List?>(
                stream: searchBloc.product,
                builder: (context, AsyncSnapshot<List?> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            linkingScreen.goToNextScreen(
                                context,
                                DetailsScreen(
                                  snapshot.data?[index]['product_id'] ?? 0,
                                  snapshot.data?[index]['name'] ?? '',
                                  snapshot.data?[index]['quantity'] ?? 0,
                                  snapshot.data?[index]['image'] ?? '',
                                  snapshot.data?[index]['exp_date'] ?? '',
                                  snapshot.data?[index]['description'] ?? '',
                                  snapshot.data?[index]['price'] ?? 0,
                                  snapshot.data?[index]['views'] ?? 0,
                                  snapshot.data?[index]['user_id'] ?? 0,
                                  snapshot.data?[index]['category_id'] ?? 0,
                                  snapshot.data?[index]['created_at'] ?? '',
                                  snapshot.data?[index]['updated_at'] ?? '',
                                ));
                          },
                          child: Container(
                            margin:
                            EdgeInsets.only(left: 15, right: 15, top: 15),
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
                                          width: MediaQuery
                                              .of(context)
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
