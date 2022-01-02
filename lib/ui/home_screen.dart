//import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled11/bloc/product_bloc.dart';
import 'package:untitled11/helper/connect_screen.dart';
import 'package:untitled11/ui/details_screen.dart';
import 'package:untitled11/ui/profile_screen.dart';
import 'package:untitled11/ui/search_screen.dart';
import 'package:http/http.dart' as http;


import 'add_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int c = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Product'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              linkingScreen.goToNextScreen(context, SearchScreen());
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [

          //Text('categories'),
          Container(
            height: 150,
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                 // if(index==0)
                   // var a='https://cdn3.droom.in/uploads/category/jaguar/20171211103003000000-3659779970629297153.png';
                  return InkWell(
                    onTap: () {
                      c = index;
                      setState(() {});
                    },
                    child: Container(

                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      height: 100,
                      width: 110,
                      color: Colors.grey.withOpacity(0.5),
                      child: Container(child:
                       Expanded(
                        child: ClipRRect(
                         borderRadius:
                         BorderRadius.circular(10),
                         child: Image.network(
                         'https://freesvg.org/img/1550271447.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context)
                        .size
                        .width,
                      ),),),


                    ),
                  ),
                  );
                }),
          ),
          Expanded(
            child: StreamBuilder<List?>(
                stream: productBloc.product,
                builder: (context, AsyncSnapshot<List?> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data?[index]['category_id'] == c) {
                          return GestureDetector(
                            onTap: () async {
                              var uri = Uri.http('cryptic-crag-48403.herokuapp.com' ,'/api/products/'+ snapshot.data![index]['product_id'].toString());
                              final response = await http.get(uri);
                              print (response.body);
                              if(response.statusCode == 200 ||response.statusCode == 201 ) {
                                final result = jsonDecode(response.body);
                                print("==================="+result['The product']['product_id'].toString());

                                linkingScreen.goToNextScreen(
                                    context,
                                    DetailsScreen(
                                      result['The product']['product_id']??0,
                                      result['The product']['name']??'mm',
                                      result['The product']['quantity']??0,
                                      result['The product']['image']??'nn',
                                      result['The product']['exp_date']??'nn',
                                      result['The product']['description']??'nnnn',
                                      result['The product']['price']?? 0,
                                      result['Views']??0,
                                      result['The product']['user_id']??0,
                                      result['The product']['category_id']??1,
                                      result['The product']['created_at']??'nn',
                                      result['The product']['updated_at']??'nn',
                                      result['Likes']??0,
                                      result['Comments']??0,
                                      result['The product']['current_price'].toString()??'nn',
                                    ));


                              } else {
                                throw Exception("Failed to load products!");
                              }
/*
                              linkingScreen.goToNextScreen(
                                  context,
                                  DetailsScreen(
                                    snapshot.data?[index]['product_id']??0,
                                    snapshot.data?[index]['name']??'',
                                    snapshot.data?[index]['quantity']??0,
                                    snapshot.data?[index]['image']??'',
                                    snapshot.data?[index]['exp_date']??'',
                                    snapshot.data?[index]['description']??'',
                                    snapshot.data?[index]['price']??0,
                                    snapshot.data?[index]['views']??0,
                                    snapshot.data?[index]['user_id']??0,
                                    snapshot.data?[index]['category_id']??0,
                                    snapshot.data?[index]['created_at']??'',
                                    snapshot.data?[index]['updated_at']??'',
                                  ));

 */
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
                        }
                        return SizedBox.shrink();
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
                }),
          ),
        ],
      ),
    );
  }
}
