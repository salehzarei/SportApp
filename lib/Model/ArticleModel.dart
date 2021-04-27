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
    int id;
    String pic;
    String status_title;
    String summary;
    String title;
    int uid;

    ArticleModelPost({this.category, this.category_title, this.description, this.film, this.hits, this.id, this.pic, this.status_title, this.summary, this.title, this.uid});

    factory ArticleModelPost.fromJson(Map<String, dynamic> json) {
        return ArticleModelPost(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'], 
            film: json['film'], 
            hits: json['hits'], 
            id: json['id'], 
            pic: json['pic'], 
            status_title: json['status_title'], 
            summary: json['summary'], 
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
        data['pic'] = this.pic;
        data['status_title'] = this.status_title;
        data['summary'] = this.summary;
        data['title'] = this.title;
        data['uid'] = this.uid;
        return data;
    }
}