class MyPlanListModel {
    List<MyPlanListData> data;

    MyPlanListModel({this.data});

    factory MyPlanListModel.fromJson(Map<String, dynamic> json) {
        return MyPlanListModel(
            data: json['data'] != null ? (json['data'] as List).map((i) => MyPlanListData.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class MyPlanListData {
    int active;
    int amount;
    String coupon;
    int coupon_discount;
    int discount;
    String expire_date;
    int id;
    int payment;
    String payment_type_title;
    String pic;
    String status;
    String thumb;
    String title;

    MyPlanListData({this.active, this.amount, this.coupon, this.coupon_discount, this.discount, this.expire_date, this.id, this.payment, this.payment_type_title, this.pic, this.status, this.thumb, this.title});

    factory MyPlanListData.fromJson(Map<String, dynamic> json) {
        return MyPlanListData(
            active: json['active'], 
            amount: json['amount'], 
            coupon: json['coupon'], 
            coupon_discount: json['coupon_discount'], 
            discount: json['discount'], 
            expire_date: json['expire_date'], 
            id: json['id'], 
            payment: json['payment'], 
            payment_type_title: json['payment_type_title'], 
            pic: json['pic'], 
            status: json['status'], 
            thumb: json['thumb'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['active'] = this.active;
        data['amount'] = this.amount;
        data['coupon'] = this.coupon;
        data['coupon_discount'] = this.coupon_discount;
        data['discount'] = this.discount;
        data['expire_date'] = this.expire_date;
        data['id'] = this.id;
        data['payment'] = this.payment;
        data['payment_type_title'] = this.payment_type_title;
        data['pic'] = this.pic;
        data['status'] = this.status;
        data['thumb'] = this.thumb;
        data['title'] = this.title;
        return data;
    }
}