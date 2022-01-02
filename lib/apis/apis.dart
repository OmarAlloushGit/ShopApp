import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final Dio _dio = Dio();
  String _ServerUrl = 'cryptic-crag-48403.herokuapp.com';

  Future<http.Response?> regesterApi(
      String email,
      String pass,
      String name,
      String cpass,
      String furl,
      String wurl,
      String age,
      String phoneNumber) async {
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

        return response;
      } else {
        print('else');
        return response;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future addProductApi(String name, String path, String ed,
      String category, String quantity, String price, String token, discount , date
      ) async {
    print('enter');
    // try {
    var formData = FormData.fromMap({
      'name': name,
      'quantity': quantity,
      'image': await MultipartFile.fromFile(path),
      'exp_date': ed,
      'description': 'this is a loudspaker',
      'price': price,
      'category_id': category,
      'list_discounts[0][discount_percentage]':discount[0] ,
      'list_discounts[0][date]': date[0],
      'list_discounts[1][discount_percentage]': discount[1],
      'list_discounts[1][date]': date[1],
    });
    final response = await _dio.post('http://$_ServerUrl/api/products',
        data: formData,
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }));

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      print(response.data);
      print(response.statusCode);
      return response.data;
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
      var uri = Uri.http(_ServerUrl, '/api/login/', cuuBody);

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
      final response = await Dio().get('http://$_ServerUrl/api/products');
      if (response.statusCode == 200) {
        print(response.toString());
        return response.data;
      } else {
        print('else');
      }
    } catch (e) {
      print('$e');
    }
  }

  Future<List?> SearchApi(String from, String to) async {
    try {
      var uri = Uri.https(_ServerUrl, '/api/products', {
        'price_from': '1',
        'price_to': to,
      });

      final response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
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
