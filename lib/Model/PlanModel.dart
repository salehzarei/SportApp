class PlanModel {
  List<PlanData> data;

  PlanModel({this.data});

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => PlanData.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['`data`'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlanData {
  String count_dayes;
  String description;
  int id;
  int off;
  String pic;
  int price;
  String title;

  PlanData(
      {this.count_dayes,
      this.description,
      this.id,
      this.off,
      this.pic,
      this.price,
      this.title});

  factory PlanData.fromJson(Map<String, dynamic> json) {
    return PlanData(
      count_dayes: json['count_dayes'],
      description: json['description'],
      id: json['id'],
      off: json['off'],
      pic: json['pic'],
      price: json['price'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_dayes'] = this.count_dayes;
    data['description'] = this.description;
    data['id'] = this.id;
    data['off'] = this.off;
    data['pic'] = this.pic;
    data['price'] = this.price;
    data['title'] = this.title;
    return data;
  }
}

class MypackagesModel {
  int id;
  String title;
  int amount;
  int discount;
  int couponDiscount;
  String coupon;
  String pic;
  String thumb;
  int payment;
  String expireDate;
  String paymentTypeTitle;
  int active;
  String status;

  MypackagesModel(
      {this.id,
      this.title,
      this.amount,
      this.discount,
      this.couponDiscount,
      this.coupon,
      this.pic,
      this.thumb,
      this.payment,
      this.expireDate,
      this.paymentTypeTitle,
      this.active,
      this.status});

  MypackagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    amount = json['amount'];
    discount = json['discount'];
    couponDiscount = json['coupon_discount'];
    coupon = json['coupon'];
    pic = json['pic'];
    thumb = json['thumb'];
    payment = json['payment'];
    expireDate = json['expire_date'];
    paymentTypeTitle = json['payment_type_title'];
    active = json['active'];
    status = json['status'];
  }
}
