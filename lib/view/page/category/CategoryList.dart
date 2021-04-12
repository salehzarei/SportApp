import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/component/Constans.dart';

class CategoryList extends StatelessWidget {
  final Controller activ = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              margin: EdgeInsets.all(0),
              // elevation: 10.0,
              // shape:
              //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: Container(
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'جستجو در اسپورت'),
                    ))
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.shopping_basket_outlined), onPressed: () {})
            ],
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            activ.catActive.value = index;
                          },
                          child: Container(
                            // alignment: Alignment.center,
                            height: 100,
                            // width: 100,
                            decoration: BoxDecoration(
                                color: activ.catActive.value == index
                                    ? Colors.white
                                    : Colors.grey,
                                border: Border(
                                    right: BorderSide(
                                        width: activ.catActive.value == index
                                            ? 5
                                            : 0,
                                        color: Theme.of(context).primaryColor),
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey[350]))),
                            padding: EdgeInsets.all(5),
                            // color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.ac_unit,
                                  color: activ.catActive.value == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'تور و سفر',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      divider(title: 'تور و سفر', callback: (){}),
                      Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 3 / 3,
                              crossAxisCount: 3,
                            ),
                            itemCount: 6,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // alignment: Alignment.center,
                                    // margin: EdgeInsets.only(left: 10),
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://assets1.risnews.com/styles/content_sm/s3/2019-09/Big_Lots_CliftonPlaza.jpg?itok=5K_InGyc"),
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'تور چند روزه',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
