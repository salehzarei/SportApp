import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/component/Constans.dart';

class SearchPage extends StatelessWidget {
  final Controller active = Get.put(Controller());
  FocusNode _searchFocus = FocusNode();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 8),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_rounded, size: 20, color: Colors.grey[600]),),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child:textFormFieldSearchHintWidget(
                            context: context,
                            focus: _searchFocus,
                            controller: _searchController,
                            hint: "متن جستجو",
                            maxLine: 1,
                            keyboardType: TextInputType.text,
                            maxLength: 1000))
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(

                      );
                    },))
          ],
        ),
      ),
    );
  }
}
