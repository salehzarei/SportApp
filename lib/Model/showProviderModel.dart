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
    int blog_count;
    String cell;
    String description;
    String email;
    String expire;
    int following;
    List<Gallery> gallery;
    int id;
    List<Interest> interest;
    String lat;
    int level;
    String level_title;
    String lng;
    int me;
    int package_count;
    String pic;
    int special;
    String title;

    Info({this.activity_scope, this.address, this.blog_count, this.cell, this.description, this.email, this.expire, this.following, this.gallery, this.id, this.interest, this.lat, this.level, this.level_title, this.lng, this.me, this.package_count, this.pic, this.special, this.title});

    factory Info.fromJson(Map<String, dynamic> json) {
        return Info(
            activity_scope: json['activity_scope'] != null ? (json['activity_scope'] as List).map((i) => ActivityScope.fromJson(i)).toList() : null, 
            address: json['address'], 
            blog_count: json['blog_count'], 
            cell: json['cell'], 
            description: json['description'], 
            email: json['email'], 
            expire: json['expire'], 
            following: json['following'], 
            gallery: json['gallery'] != null ? (json['gallery'] as List).map((i) => Gallery.fromJson(i)).toList() : null, 
            id: json['id'], 
            interest: json['interest'] != null ? (json['interest'] as List).map((i) => Interest.fromJson(i)).toList() : null, 
            lat: json['lat'], 
            level: json['level'], 
            level_title: json['level_title'], 
            lng: json['lng'], 
            me: json['me'], 
            package_count: json['package_count'], 
            pic: json['pic'], 
            special: json['special'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['blog_count'] = this.blog_count;
        data['cell'] = this.cell;
        data['description'] = this.description;
        data['email'] = this.email;
        data['expire'] = this.expire;
        data['following'] = this.following;
        data['id'] = this.id;
        data['lat'] = this.lat;
        data['level'] = this.level;
        data['level_title'] = this.level_title;
        data['lng'] = this.lng;
        data['me'] = this.me;
        data['package_count'] = this.package_count;
        data['pic'] = this.pic;
        data['special'] = this.special;
        data['title'] = this.title;
        if (this.activity_scope != null) {
            data['activity_scope'] = this.activity_scope.map((v) => v.toJson()).toList();
        }
        if (this.gallery != null) {
            data['gallery'] = this.gallery.map((v) => v.toJson()).toList();
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

class Gallery {
    int id;
    String pic;
    String title;

    Gallery({this.id, this.pic, this.title});

    factory Gallery.fromJson(Map<String, dynamic> json) {
        return Gallery(
            id: json['id'], 
            pic: json['pic'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['pic'] = this.pic;
        data['title'] = this.title;
        return data;
    }
}