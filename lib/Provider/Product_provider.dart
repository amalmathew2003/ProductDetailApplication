import 'package:day25_task/Model/Products.dart';
import 'package:day25_task/service/Api_service.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<Products>? plist = [];
  bool isloading = false;
  Apiservice apiservice = Apiservice();

  Future<void> facth() async {
    isloading = true;
    notifyListeners();

    plist = await apiservice.getdata() ?? [];

    isloading = false;
    notifyListeners();
  }
}
