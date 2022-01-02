import 'package:rxdart/rxdart.dart';
//import 'package:untitled11/api/apis.dart';
import 'package:untitled11/apis/apis.dart';

class SearchBloc {
  String from='';
  String to='';
  Future<List?> fetchProduct() => apiProvider.SearchApi(from,to);
  final _searchBlocFetcher = BehaviorSubject<List?>();

  Stream<List?> get product => _searchBlocFetcher.stream;

  fetch()async{
    try{
      List? product= await fetchProduct();
      _searchBlocFetcher.sink.add(product);
    }catch(e){
      _searchBlocFetcher.addError(e);
      print('error   $e');
    }

  }
}
final searchBloc=SearchBloc();