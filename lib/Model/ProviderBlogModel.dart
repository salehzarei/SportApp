class ProviderBlogModel {
  ProviderBlogData data;

    ProviderBlogModel({this.data});

    factory ProviderBlogModel.fromJson(Map<String, dynamic> json) {
        return ProviderBlogModel(
            data: json['data'] != null ? ProviderBlogData.fromJson(json['data']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}

class ProviderBlogData {
    String category;
    String category_title;
    String description;
    List<Gallery> gallery;
    int hits;
    int id;
    int status;
    String status_title;
    String summary;
    List<String> tag;
    String title;
    int uid;

    ProviderBlogData({this.category, this.category_title, this.description, this.gallery, this.hits, this.id, this.status, this.status_title, this.summary, this.tag, this.title, this.uid});

    factory ProviderBlogData.fromJson(Map<String, dynamic> json) {
        return ProviderBlogData(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'], 
            gallery: json['gallery'] != null ? (json['gallery'] as List).map((i) => Gallery.fromJson(i)).toList() : null, 
            hits: json['hits'], 
            id: json['id'], 
            status: json['status'], 
            status_title: json['status_title'], 
            summary: json['summary'], 
            tag: json['tag'] != null ? new List<String>.from(json['tag']) : null, 
            title: json['title'], 
            uid: json['uid'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category'] = this.category;
        data['category_title'] = this.category_title;
        data['description'] = this.description;
        data['hits'] = this.hits;
        data['id'] = this.id;
        data['status'] = this.status;
        data['status_title'] = this.status_title;
        data['summary'] = this.summary;
        data['title'] = this.title;
        data['uid'] = this.uid;
        if (this.gallery != null) {
            data['gallery'] = this.gallery.map((v) => v.toJson()).toList();
        }
        if (this.tag != null) {
            data['tag'] = this.tag;
        }
        return data;
    }
}

class Gallery {
    int id;
    String pic;
    String pic_name;

    Gallery({this.id, this.pic, this.pic_name});

    factory Gallery.fromJson(Map<String, dynamic> json) {
        return Gallery(
            id: json['id'], 
            pic: json['pic'], 
            pic_name: json['pic_name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['pic'] = this.pic;
        data['pic_name'] = this.pic_name;
        return data;
    }
}