import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportapplication/Model/MyGalleryModel.dart';
import 'package:sportapplication/view/component/Constans.dart';

itemGallery({@required MyGalleryPost data,@required removeGallery,@required showClick}){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300], width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0, 3),
            blurRadius: 12,
          )
        ]),
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    margin: EdgeInsets.only(left: 6, right: 6, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: AspectRatio(
                      aspectRatio: 2 / 2,
                      child: Stack(
                        children: [
                          imageShower(
                              imageUrl: data.pic,
                              margin: EdgeInsets.only(left: 0, right: 0),
                              fit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(8)),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(colors: [
                                    Colors.black26,
                                    Colors.grey[800],
                                  ])),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 6),
                              child: Text(
                                data.status_title,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: showClick,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(colors: [
                                          Colors.black26,
                                          Colors.grey[800],
                                        ])),
                                    margin: EdgeInsets.only(top:  6 ,right: 6),
                                    padding: EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.zoom_out_map,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            data.title,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete_forever_rounded , size: 25 , color: Colors.red,
                          ), onPressed: removeGallery,
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),

      ],
    ),
  );
}