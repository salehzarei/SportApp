class ShowProviderModel {
    Info info;

    ShowProviderModel({this.info});

    factory ShowProviderModel.fromJson(Map<String, dynamic> json) {
        return ShowProviderModel(
            info: json['info'] != null ? Info.fromJson(json['info']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.info != null) {
            data['info'] = this.info.toJson();
        }
        return data;
    }
}

class Info {
    List<ActivityScope> activity_scope;
    String address;
    String cell;
    String description;
    String email;
    String expire;
    int following;
    int id;
    List<Interest> interest;
    String lat;
    String level_title;
    int level;
    int blog_count;
    int package_count;
    String lng;
    String pic;
    String title;

    Info({this.activity_scope, this.address,this.level_title, this.cell,this.blog_count,this.package_count, this.description, this.email, this.expire, this.following, this.id, this.interest, this.lat, this.level, this.lng, this.pic, this.title});

    factory Info.fromJson(Map<String, dynamic> json) {
        return Info(
            activity_scope: json['activity_scope'] != null ? (json['activity_scope'] as List).map((i) => ActivityScope.fromJson(i)).toList() : null, 
            address: json['address'], 
            cell: json['cell'], 
            description: json['description'], 
            email: json['email'],
            level_title: json['level_title'],
            expire: json['expire'],
            following: json['following'], 
            id: json['id'], 
            interest: json['interest'] != null ? (json['interest'] as List).map((i) => Interest.fromJson(i)).toList() : null, 
            lat: json['lat'], 
            level: json['level'],
            package_count: json['package_count'],
            blog_count: json['blog_count'],
            lng: json['lng'],
            pic: json['pic'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['cell'] = this.cell;
        data['description'] = this.description;
        data['email'] = this.email;
        data['expire'] = this.expire;
        data['following'] = this.following;
        data['id'] = this.id;
        data['lat'] = this.lat;
        data['level'] = this.level;
        data['lng'] = this.lng;
        data['pic'] = this.pic;
        data['title'] = this.title;
        if (this.activity_scope != null) {
            data['activity_scope'] = this.activity_scope.map((v) => v.toJson()).toList();
        }
        if (this.interest != null) {
            data['interest'] = this.interest.map((v) => v.toJson()).toList();
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