import 'package:flutter/material.dart';
import 'package:test_list/testController.dart';
import 'package:get/get.dart';

class Home extends GetView<TestController> {

  TestController testController = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Marketing Pdcl')),
       body:
       Container(
         child: Column(
           children: [
           TextField(
               onChanged: (value) {
                 testController.filterTest(value);
               },
               decoration: const InputDecoration(
                 labelText: 'Search',
                 suffixIcon: Icon(Icons.search),
               ),
             ),

            SizedBox(
              height: 10,
            ),

             Expanded(
               child: Container(
                 child:
                 testController.obx((test) =>
                     Center(
                   child:new ListView.builder(
                    // itemCount: test!.length ,
                     itemCount: testController.foundTests.value.length,
                     itemBuilder: (BuildContext context, int index){
                       return Card(
                           child: Column(
                             children: [
                               ListTile(
                                 title: Text(controller.foundTests.value[index]['testName']),
                                 subtitle: Text(controller.foundTests.value[index]['testPrice'].toString()),
                                 // leading: CircleAvatar(
                                 //   backgroundImage: NetworkImage(
                                 //       data[index]['picture']['thumbnail']
                                 //   ),
                                 // ),
                               )
                             ],
                           )
                       );
                     },
                   ),
                 )),
               ),
             ),

           ],
         ),
       )


    );

       // Column(children: [
       //   GestureDetector(
       //     onTap: (){
       //       testController.fetchTestList();
       //     },
       //     child: Container(
       //       margin: const EdgeInsets.all(20),
       //       width: double.maxFinite,
       //       height: 100,
       //       decoration: BoxDecoration(
       //           borderRadius: BorderRadius.circular(20),
       //           color: Colors.greenAccent
       //       ),
       //       child: Center(child: Text("Tap",
       //         style: TextStyle(
       //             fontSize: 20,
       //             color: Colors.white
       //         ),)),
       //     ),
       //   ),
       //   Expanded(
       //        child:ListView(shrinkWrap: true, children: [
       //          ...testController.testList
       //              .map((e) => Card(
       //              child: Padding(
       //                  padding: EdgeInsets.all(5),
       //                  child: Column(children: [
       //                    Row(children: [
       //                      CircleAvatar(radius: 25),
       //                      SizedBox(width: 7),
       //                      Expanded(
       //                          child: Column(
       //                              crossAxisAlignment:
       //                              CrossAxisAlignment.start,
       //                              children: [
       //                                Text(e.testName,
       //                                    style: TextStyle(
       //                                        fontSize: 16,
       //                                        color: Colors.black)),
       //                                SizedBox(height: 3),
       //                                Text('Rs. ${e.categoryName}',
       //                                    style: TextStyle(
       //                                        fontSize: 16,
       //                                        color: Colors.black)),
       //                                SizedBox(height: 3),
       //                                Text('${e.testName}',
       //                                    style: TextStyle(
       //                                        fontSize: 14,
       //                                        color: Colors.black54)),
       //                              ])),
       //
       //                    ]),
       //                    SizedBox(height: 8),
       //
       //                  ]))))
       //              .toList()
       //        ]))
       // ]
       //  ));
  }
}

