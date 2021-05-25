class ProviderModel {
    int count;
    List<ProviderPost> post;

    ProviderModel({this.count, this.post});

    factory ProviderModel.fromJson(Map<String, dynamic> json) {
        return ProviderModel(
            count: json['count'], 
            post: json['post'] != null ? (json['post'] as List).map((i) => ProviderPost.fromJson(i)).toList() : null,
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

class ProviderPost {
    String address;
    String cell;
    String description;
    String email;
    String expire;
    int following;
    int id;
    String lat;
    String level_title;
    int level;
    String lng;
    String pic;
    String title;
    int package_count;
    int blog_count;
    int me;

    ProviderPost({this.address, this.cell, this.level_title,this.package_count, this.blog_count, this.me, this.description, this.email, this.expire, this.following, this.id, this.lat, this.level, this.lng, this.pic, this.title});

    factory ProviderPost.fromJson(Map<String, dynamic> json) {
        return ProviderPost(
            address: json['address'], 
            cell: json['cell'], 
            description: json['description'], 
            email: json['email'],
            level_title: json['level_title'],
            expire: json['expire'],
            following: json['following'], 
            id: json['id'], 
            lat: json['lat'], 
            level: json['level'], 
            lng: json['lng'], 
            pic: json['pic'], 
            title: json['title'],
            package_count: json['package_count'],
            blog_count: json['blog_count'],
            me: json['me'],
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
        return data;
    }
}