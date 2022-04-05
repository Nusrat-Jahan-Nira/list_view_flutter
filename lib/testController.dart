import 'dart:convert';
import 'dart:core';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:test_list/provider.dart';


class TestController extends GetxController with StateMixin<List<dynamic>>{

  Rx<List<Map<String, dynamic>>> foundTests =
  Rx<List<Map<String, dynamic>>>([]);

  List<Map<String, dynamic>>? TestLists;


  List<dynamic>? tList;

  List<dynamic> getLists(){
    return [...?tList];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Provider().fetchTestList().then((value) {
      tList = value;
      foundTests.value = getLists().cast<Map<String, dynamic>>();
      change(value, status: RxStatus.success());
    }, onError: (error){
      change(null, status: RxStatus.error(error.toString()));
    });

    foundTests.value = getLists().cast<Map<String, dynamic>>();

    //TestLists = Provider().allTests;
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }

  //

  void filterTest(String testName) {
    List<Map<String, dynamic>>? results = [];
    TestLists = getLists().cast<Map<String, dynamic>>();

    if (testName.isEmpty) {
      results = TestLists;
    }
    else {
      results = TestLists!
          .where((element) => element["testName"]
          .toString()
          .toLowerCase()
          .toUpperCase()
          .contains(testName.toUpperCase())
           )
          .toList();
    }
    foundTests.value = results!;
    update();
  }

}





