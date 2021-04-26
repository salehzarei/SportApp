class ShowPackageModel {
    Data data;

    ShowPackageModel({this.data});

    factory ShowPackageModel.fromJson(Map<String, dynamic> json) {
        return ShowPackageModel(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}

class Data {
    int category;
    String category_title;
    String description;
    int discount;
    int discount_type;
    String edate;
    List<Gallery> gallery;
    int id;
    String reason;
    String sdate;
    int status;
    String title;
    int uid;

    Data({this.category, this.category_title, this.description, this.discount, this.discount_type, this.edate, this.gallery, this.id, this.reason, this.sdate, this.status, this.title, this.uid});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'], 
            discount: json['discount'], 
            discount_type: json['discount_type'], 
            edate: json['edate'], 
            gallery: json['gallery'] != null ? (json['gallery'] as List).map((i) => Gallery.fromJson(i)).toList() : null, 
            id: json['id'], 
            reason: json['reason'], 
            sdate: json['sdate'], 
            status: json['status'], 
            title: json['title'], 
            uid: json['uid'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category'] = this.category;
        data['category_title'] = this.category_title;
        data['description'] = this.description;
        data['discount'] = this.discount;
        data['discount_type'] = this.discount_type;
        data['edate'] = this.edate;
        data['id'] = this.id;
        data['reason'] = this.reason;
        data['sdate'] = this.sdate;
        data['status'] = this.status;
        data['title'] = this.title;
        data['uid'] = this.uid;
        if (this.gallery != null) {
            data['gallery'] = this.gallery.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Gallery {
    int id;
    String pic;
    String pic_name;

    Gallery({this.id, this.pic, this.pic_name});

    factory Gallery.fromJson(Map<String, dynamic> json) {
        return Gallery(
            id: json['id'], 
            pic: json['pic'], 
            pic_name: json['pic_name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['pic'] = this.pic;
        data['pic_name'] = this.pic_name;
        return data;
    }
}
