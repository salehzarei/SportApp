import 'package:flutter/material.dart';
import 'package:sportapplication/Model/providerModel.dart';
import 'package:sportapplication/view/component/Constans.dart';

followListItem({@required BuildContext context,@required int index,@required ProviderPost data,@required removeProvider}) {
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
    child: InkWell(
      onTap: () {},
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 2 / 2,
                      child: imageShower(
                          imageUrl: data.pic,
                          margin: EdgeInsets.all(8),
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(100)),
                    )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                data.title,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: removeProvider,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(color: Colors.white)
                                      )
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.red)),
                              child: Text(
                                "حذف از دنبال کننده ها",
                                style: TextStyle(fontSize: 13, color: Colors.white),
                              ),),
                          ],
                        ),

                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            height: 1,
            color: Colors.grey[300],
          ),
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  size: 18, color: Colors.grey[600]),
              SizedBox(
                width: 8,
              ),
              Text(
                "پنج راه سناباد بین ابن سینای 16 و 18 پلاک 210",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey[800]),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
