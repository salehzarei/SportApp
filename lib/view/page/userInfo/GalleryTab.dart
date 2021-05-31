import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/showProviderModel.dart';
import 'package:sportapplication/view/component/Constans.dart';

class GalleryTab extends StatefulWidget {

  List<Gallery> gallery;


  GalleryTab(this.gallery);

  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 8),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 3,
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 5
            ),
            itemCount: widget.gallery.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>_itemsGallery(widget.gallery[index]))

    );
  }

  _itemsGallery(Gallery data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(8) ,bottomLeft: Radius.circular(8) ),
                  gradient: LinearGradient(colors: [
                    Colors.black26,
                    Colors.grey[800],
                  ])),
              padding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: 6),
              child: Text(
                data.title,
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
                  onTap: () =>  Get.dialog(_showQr(data.pic)),
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
      ),
    );
  }

  _showQr(String url) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 4/3,
                    child: imageShower(
                        imageUrl: url,
                        margin: EdgeInsets.all(0),
                        fit: BoxFit.fill,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(colors: [
                                  Colors.black26,
                                  Colors.grey[800],
                                ])),
                            margin: EdgeInsets.only(top: 6, right: 6),
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
