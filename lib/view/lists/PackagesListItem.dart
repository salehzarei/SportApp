import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';

import 'PackagesListItemDetail.dart';

class PackagesListItem extends StatelessWidget {
  final Controller off = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // color: Colors.black,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(PackagesListItemDetail());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(left: 10),
                // height: 100,
                width: 200,

                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://assets1.risnews.com/styles/content_sm/s3/2019-09/Big_Lots_CliftonPlaza.jpg?itok=5K_InGyc"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            '30%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('هیومن پارک تهران'),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Text(
                                    '75.000',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14),
                                  ),
                                  off.off.value == 0
                                      ? Positioned(
                                          top: 7,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 1,
                                            color: Colors.red,
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '50.000  تومان',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_basket_outlined,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '1,204 خرید',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 15,
                                  ),
                                  Text(
                                    '2.6',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
