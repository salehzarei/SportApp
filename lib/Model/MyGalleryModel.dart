class MyGalleryModel {
    int count;
    List<MyGalleryPost> post;

    MyGalleryModel({this.count, this.post});

    factory MyGalleryModel.fromJson(Map<String, dynamic> json) {
        return MyGalleryModel(
            count: json['count'], 
            post: json['post'] != null ? (json['post'] as List).map((i) => MyGalleryPost.fromJson(i)).toList() : null,
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

class MyGalleryPost {
    int id;
    String pic;
    int status;
    String status_title;
    String title;

    MyGalleryPost({this.id, this.pic, this.status, this.status_title, this.title});

    factory MyGalleryPost.fromJson(Map<String, dynamic> json) {
        return MyGalleryPost(
            id: json['id'], 
            pic: json['pic'], 
            status: json['status'], 
            status_title: json['status_title'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['pic'] = this.pic;
        data['status'] = this.status;
        data['status_title'] = this.status_title;
        data['title'] = this.title;
        return data;
    }
}