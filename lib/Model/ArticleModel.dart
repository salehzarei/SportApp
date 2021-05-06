class ArticleModel {
    int count;
    List<ArticleModelPost> post;

    ArticleModel({this.count, this.post});

    factory ArticleModel.fromJson(Map<String, dynamic> json) {
        return ArticleModel(
            count: json['count'], 
            post: json['post'] != null ? (json['post'] as List).map((i) => ArticleModelPost.fromJson(i)).toList() : null,
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

class ArticleModelPost {
    String category;
    String category_title;
    String description;
    String film;
    int hits;
    int favorit;
    int id;
    int status;
    String owner;
    String owner_pic;
    String pic;
    String summary;
    String status_title;
    List<String> tages;
    String title;
    int uid;

    ArticleModelPost({this.category, this.category_title, this.favorit,this.status, this.status_title, this.description, this.film, this.hits, this.id, this.owner, this.owner_pic, this.pic, this.summary, this.tages, this.title, this.uid});

    factory ArticleModelPost.fromJson(Map<String, dynamic> json) {
        return ArticleModelPost(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'],
            status_title: json['status_title'],
            film: json['film'],
            hits: json['hits'],
            favorit: json['favorit'],
            id: json['id'],
            status: json['status'],
            owner: json['owner'],
            owner_pic: json['owner_pic'], 
            pic: json['pic'], 
            summary: json['summary'], 
            tages: json['tages'] != null ? new List<String>.from(json['tages']) : null, 
            title: json['title'], 
            uid: json['uid'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category'] = this.category;
        data['category_title'] = this.category_title;
        data['description'] = this.description;
        data['film'] = this.film;
        data['hits'] = this.hits;
        data['id'] = this.id;
        data['owner'] = this.owner;
        data['owner_pic'] = this.owner_pic;
        data['pic'] = this.pic;
        data['summary'] = this.summary;
        data['title'] = this.title;
        data['uid'] = this.uid;
        if (this.tages != null) {
            data['tages'] = this.tages;
        }
        return data;
    }
}
