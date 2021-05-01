class ShowPackageModel {
    ShowPackageData data;

    ShowPackageModel({this.data});

    factory ShowPackageModel.fromJson(Map<String, dynamic> json) {
        return ShowPackageModel(
            data: json['data'] != null ? ShowPackageData.fromJson(json['data']) : null,
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

class ShowPackageData {
    int category;
    String category_title;
    String description;
    int discount;
    int discount_type;
    String edate;
    int final_price;
    List<Gallery> gallery;
    int hits;
    int favorit;
    int id;
    String owner;
    String owner_address;
    String owner_cell;
    String owner_pic;
    int price;
    String qrcode;
    String sdate;
    String title;
    int uid;

    ShowPackageData({this.category, this.category_title, this.favorit, this.description, this.discount, this.discount_type, this.edate, this.final_price, this.gallery, this.hits, this.id, this.owner, this.owner_address, this.owner_cell, this.owner_pic, this.price, this.qrcode, this.sdate, this.title, this.uid});

    factory ShowPackageData.fromJson(Map<String, dynamic> json) {
        return ShowPackageData(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'], 
            discount: json['discount'], 
            discount_type: json['discount_type'], 
            edate: json['edate'],
            favorit: json['favorit'],
            final_price: json['final_price'], 
            gallery: json['gallery'] != null ? (json['gallery'] as List).map((i) => Gallery.fromJson(i)).toList() : null, 
            hits: json['hits'], 
            id: json['id'], 
            owner: json['owner'], 
            owner_address: json['owner_address'], 
            owner_cell: json['owner_cell'], 
            owner_pic: json['owner_pic'], 
            price: json['price'], 
            qrcode: json['qrcode'], 
            sdate: json['sdate'], 
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
        data['final_price'] = this.final_price;
        data['hits'] = this.hits;
        data['id'] = this.id;
        data['owner'] = this.owner;
        data['owner_address'] = this.owner_address;
        data['owner_cell'] = this.owner_cell;
        data['owner_pic'] = this.owner_pic;
        data['price'] = this.price;
        data['qrcode'] = this.qrcode;
        data['sdate'] = this.sdate;
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