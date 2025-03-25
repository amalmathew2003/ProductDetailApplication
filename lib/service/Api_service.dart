import 'dart:convert';

import 'package:day25_task/Model/Products.dart';
import 'package:day25_task/Model/Resp_Product.dart';
import 'package:http/http.dart'as http;

class Apiservice{
final baseurl="https://dummyjson.com";
Future<List<Products>?> getdata() async {
final response=await http.get(Uri.parse("$baseurl/products"));
if(response.statusCode>=200&&response.statusCode<=299){
var json=jsonDecode(response.body);
var res=RespProduct.fromJson(json);
var list=res.products;
return list;
}
}
}