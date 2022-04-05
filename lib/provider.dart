import 'dart:convert';

import 'package:get/get.dart';


class Provider extends GetConnect{

  List<Map<String, dynamic>>? allTests;

  Future <List<dynamic>> fetchTestList() async{
    final response =
    await get('https://admin.pdcl-online.com/api/Erp/Tests');

    if(response.status.hasError){
      return Future.error(response.statusText!);
    }
    else{
      return response.body;
    }
  }

  List<Map<String, dynamic>> getTestList(){
    List<Map<String, dynamic>> test = allTests!;
    return test;
  }
}