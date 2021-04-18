
import 'package:flutter/material.dart';

itemProfile({@required BuildContext context,@required String title,@required onTap}){
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(title,style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700]
                  ),)
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[600]
              )
            ],
          ),
        ),
        Container(
          color: Colors.grey[300],
          height: 1,
        )
      ],
    ),
  );
}