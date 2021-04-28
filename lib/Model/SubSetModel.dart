class SubSetModel {
    List<SubSetPost> post;

    SubSetModel({this.post});

    factory SubSetModel.fromJson(Map<String, dynamic> json) {
        return SubSetModel(
            post: json['post'] != null ? (json['post'] as List).map((i) => SubSetPost.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.post != null) {
            data['post'] = this.post.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class SubSetPost {
    int acepted;
    int blog_count;
    int i_requested;
    int id;
    int level;
    String name;
    int package_count;
    String pic;
    String address;
    String thumb;
    int user_id;

    SubSetPost({this.acepted, this.blog_count,this.address, this.i_requested, this.id, this.level, this.name, this.package_count, this.pic, this.thumb, this.user_id});

    factory SubSetPost.fromJson(Map<String, dynamic> json) {
        return SubSetPost(
            acepted: json['acepted'], 
            blog_count: json['blog_count'], 
            i_requested: json['i_requested'], 
            id: json['id'], 
            level: json['level'],
            address: json['address'],
            name: json['name'],
            package_count: json['package_count'], 
            pic: json['pic'], 
            thumb: json['thumb'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['acepted'] = this.acepted;
        data['blog_count'] = this.blog_count;
        data['i_requested'] = this.i_requested;
        data['id'] = this.id;
        data['level'] = this.level;
        data['name'] = this.name;
        data['package_count'] = this.package_count;
        data['pic'] = this.pic;
        data['thumb'] = this.thumb;
        data['user_id'] = this.user_id;
        return data;
    }
}