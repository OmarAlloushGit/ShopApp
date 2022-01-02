import 'package:rxdart/rxdart.dart';
//import 'package:untitled11/api/apis.dart';
import 'package:untitled11/apis/apis.dart';

class ProductBloc {
  Future<List?> fetchProduct() => apiProvider.prouductApi();
  final _productBlocFetcher = BehaviorSubject<List?>();

  Stream<List?> get product => _productBlocFetcher.stream;

  fetch()async{
    try{
      List? product= await fetchProduct();
      _productBlocFetcher.sink.add(product);
    }catch(e){
      _productBlocFetcher.addError(e);
      print('error   $e');
    }

  }
}
final productBloc=ProductBloc();