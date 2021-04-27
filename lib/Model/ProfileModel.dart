class UserDataModel {
    List<ActivityScope> activity_scope;
    String address;
    String cell;
    int city;
    String description;
    String email;
    int id;
    List<Interest> interest;
    String lat;
    int level;
    String level_title;
    String lng;
    String name;
    int ostan;
    String pic;
    List<Plan> plan;
    Provider provider;
    String tell;
    String thumb;
    String user_name;

    UserDataModel({this.activity_scope, this.address, this.cell, this.city, this.description, this.email, this.id, this.interest, this.lat, this.level, this.level_title, this.lng, this.name, this.ostan, this.pic, this.plan, this.provider, this.tell, this.thumb, this.user_name});

    factory UserDataModel.fromJson(Map<String, dynamic> json) {
        return UserDataModel(
            activity_scope: json['activity_scope'] != null ? (json['activity_scope'] as List).map((i) => ActivityScope.fromJson(i)).toList() : null,
            address: json['address'],
            cell: json['cell'],
            city: json['city'],
            description: json['description'],
            email: json['email'],
            id: json['id'],
            interest: json['interest'] != null ? (json['interest'] as List).map((i) => Interest.fromJson(i)).toList() : null,
            lat: json['lat'],
            level: json['level'],
            level_title: json['level_title'],
            lng: json['lng'],
            name: json['name'],
            ostan: json['ostan'],
            pic: json['pic'],
            plan: json['plan'] != null ? (json['plan'] as List).map((i) => Plan.fromJson(i)).toList() : null,
            provider: json['provider'] != null ? Provider.fromJson(json['provider']) : null,
            tell: json['tell'],
            thumb: json['thumb'],
            user_name: json['user_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['cell'] = this.cell;
        data['city'] = this.city;
        data['description'] = this.description;
        data['email'] = this.email;
        data['id'] = this.id;
        data['lat'] = this.lat;
        data['level'] = this.level;
        data['level_title'] = this.level_title;
        data['lng'] = this.lng;
        data['name'] = this.name;
        data['ostan'] = this.ostan;
        data['pic'] = this.pic;
        data['tell'] = this.tell;
        data['thumb'] = this.thumb;
        data['user_name'] = this.user_name;
        if (this.activity_scope != null) {
            data['activity_scope'] = this.activity_scope.map((v) => v.toJson()).toList();
        }
        if (this.interest != null) {
            data['interest'] = this.interest.map((v) => v.toJson()).toList();
        }
        if (this.plan != null) {
            data['plan'] = this.plan.map((v) => v.toJson()).toList();
        }
        if (this.provider != null) {
            data['provider'] = this.provider.toJson();
        }
        return data;
    }
}

class Interest {
    int id;
    String title;

    Interest({this.id, this.title});

    factory Interest.fromJson(Map<String, dynamic> json) {
        return Interest(
            id: json['id'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }
}

class Provider {
    int active;
    String expire;

    Provider({this.active, this.expire});

    factory Provider.fromJson(Map<String, dynamic> json) {
        return Provider(
            active: json['active'],
            expire: json['expire'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['active'] = this.active;
        data['expire'] = this.expire;
        return data;
    }
}

class Plan {
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

    Plan({this.active, this.amount, this.coupon, this.coupon_discount, this.discount, this.expire_date, this.id, this.payment, this.payment_type_title, this.pic, this.status, this.thumb, this.title});

    factory Plan.fromJson(Map<String, dynamic> json) {
        return Plan(
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

class ActivityScope {
    int id;
    String title;

    ActivityScope({this.id, this.title});

    factory ActivityScope.fromJson(Map<String, dynamic> json) {
        return ActivityScope(
            id: json['id'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }
}