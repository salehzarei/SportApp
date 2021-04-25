class MyPackageModel {
    int count;
    List<Post> post;

    MyPackageModel({this.count, this.post});

    factory MyPackageModel.fromJson(Map<String, dynamic> json) {
        return MyPackageModel(
            count: json['count'], 
            post: json['post'] != null ? (json['post'] as List).map((i) => Post.fromJson(i)).toList() : null, 
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

class Post {
    int category;
    String category_title;
    String description;
    int discount;
    int discount_type;
    String edate;
    int hits;
    int id;
    String pic;
    int price;
    String reason;
    String sdate;
    int status;
    String status_title;
    String title;
    int uid;

    Post({this.category, this.category_title, this.description, this.discount, this.discount_type, this.edate, this.hits, this.id, this.pic, this.price, this.reason, this.sdate, this.status, this.status_title, this.title, this.uid});

    factory Post.fromJson(Map<String, dynamic> json) {
        return Post(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'], 
            discount: json['discount'], 
            discount_type: json['discount_type'], 
            edate: json['edate'], 
            hits: json['hits'], 
            id: json['id'], 
            pic: json['pic'], 
            price: json['price'], 
            reason: json['reason'], 
            sdate: json['sdate'], 
            status: json['status'], 
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