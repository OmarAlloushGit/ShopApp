import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:untitled11/model/user_model.dart';

class ApiProvider {
  String _ServerUrl='cryptic-crag-48403.herokuapp.com';


  Future<http.Response?> regesterApi(String email, String pass, String name, String cpass,
      String furl, String wurl, String age, String phoneNumber) async {
    print('enter');
    try {
      var uri = Uri.https(_ServerUrl, '/api/register');
      var cuuBody = {
        'email': email,
        'password': pass,
        'name': name,
        'password_confirmation': cpass,
        'facebook_url': furl,
        'whatsapp_url': wurl,
        'age': age,
        'phone_number': phoneNumber
      };
      final response = await http.post(uri, body: cuuBody);

      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.body);
        return response;
      }  else {
        print('else');
        return response;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<http.Response?> addProductApi(String name, var imageUrl, String ed,
      String category, String quantity, String price,String token) async {
    print('enter');
    // try {
      var uri = Uri.https(_ServerUrl, '/api/products',);
      var cuuBody = {
        'name': name,
        'quantity': quantity,
        ///todo:file
        'image': imageUrl,
        'exp_date': ed,
        'description': 'this is a loudspaker',
        'price': price,
        'category_id': category,
        'list_discounts[0][discount_percentage]': '50',
        'list_discounts[0][date]': '2021-12-27',
        'list_discounts[1][discount_percentage]': '70',
        'list_discounts[1][date]': '2022-1-3',
      };
      final response = await http.post(uri, body: cuuBody,headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },);

      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.body);
        return response;
      }  else {
        print(response.body);
        print(response.statusCode);
        return response;
      }
    // } catch (e) {
    //   print('Error: $e');
    //   return null;
    // }
  }

  Future<http.Response?> loginApi(String email, String pass) async {
    print('$email,$pass');
    try {
      var cuuBody = {
        'email': email,
        'password': pass,
      };
      var uri =
      Uri.http(_ServerUrl, '/api/login/', cuuBody);

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      }
      if (response.statusCode == 201) {
        print(response.body);
        return response;
      } else {
        print('else');
      }
    } catch (e) {
      print('$e');
    }
  }

  Future<List?> prouductApi() async {
    try {
      var uri = Uri.https(_ServerUrl, '/api/products');

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      } else {
        print('else');
      }
    } catch (e) {
      print('$e');
    }
  }

  Future<List?> SearchApi(String from,String to) async {
    try {
      var uri = Uri.https(_ServerUrl, '/api/products',{
        'price_from':'1',
        'price_to':'5000',
      });

      final response = await http.get(uri);
      if (response.statusCode == 200||response.statusCode == 201) {
        print(response.body);
        return json.decode(response.body);
      } else {
        print('else');
        print(response.statusCode);
      }
    } catch (e) {
      print('$e');
    }
  }
}

ApiProvider apiProvider = ApiProvider();
