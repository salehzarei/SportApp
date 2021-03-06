class MyPackageModel {
    int count;
    List<MyPackagePost> post;

    MyPackageModel({this.count, this.post});

    factory MyPackageModel.fromJson(Map<String, dynamic> json) {
        return MyPackageModel(
            count: json['count'], 
            post: json['post'] != null ? (json['post'] as List).map((i) => MyPackagePost.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['count'] = this.count;
        if (this.post != null) {
            data['post'] = this.post.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class MyPackagePost {
    int category;
    String category_title;
    String description;
    int discount;
    int discount_type;
    String edate;
    int hits;
    int id;
    int favorit;
    String pic;
    int price;
    String reason;
    String sdate;
    String address;
    int status;
    String status_title;
    String owner;
    String owner_pic;
    String title;
    int hasOff;
    int final_price;
    int uid;

    MyPackagePost({this.category, this.category_title, this.address,this.owner, this.owner_pic, this.favorit,this.final_price, this.hasOff, this.description, this.discount, this.discount_type, this.edate, this.hits, this.id, this.pic, this.price, this.reason, this.sdate, this.status, this.status_title, this.title, this.uid});

    factory MyPackagePost.fromJson(Map<String, dynamic> json) {
        return MyPackagePost(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'], 
            discount: json['discount'], 
            discount_type: json['discount_type'], 
            edate: json['edate'],
            address: json['address'],
            hits: json['hits'],
            id: json['id'],
            favorit: json['favorit'],
            pic: json['pic'],
            owner_pic: json['owner_pic'],
            owner: json['owner'],
            price: json['price'],
            reason: json['reason'], 
            sdate: json['sdate'], 
            status: json['status'],
            final_price: json['final_price'],
            hasOff: json['hasOff'],
            status_title: json['status_title'],
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
        data['hits'] = this.hits;
        data['id'] = this.id;
        data['pic'] = this.pic;
        data['price'] = this.price;
        data['reason'] = this.reason;
        data['sdate'] = this.sdate;
        data['status'] = this.status;
        data['status_title'] = this.status_title;
        data['title'] = this.title;
        data['uid'] = this.uid;
        return data;
    }
}