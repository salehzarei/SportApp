import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 170,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black26,
              Colors.grey[800],
              // Colors.grey[850]
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'برای یک تجربه بی نظیر, وارد شوید.',
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor)),
                    child: Text('ورود / ثبت نام'))
              ],
            ),
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('تخفیف های من')
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('کیف پول')
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('لیست علاقه مندی ها')
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('کارت های من')
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('انتخاب شهر')
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('پشتیبانی')
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
