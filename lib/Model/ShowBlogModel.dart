class ShowModel {
  ShowModelData data;

    ShowModel({this.data});

    factory ShowModel.fromJson(Map<String, dynamic> json) {
        return ShowModel(
            data: json['data'] != null ? ShowModelData.fromJson(json['data']) : null,
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

class ShowModelData {
    String category;
    String category_title;
    String description;
    List<String> gallery;
    int hits;
    int favorit;
    int id;
    String owner;
    String owner_pic;
    String owner_cell;
    String owner_address;
    String summary;
    List<Object> tages;
    String title;
    int uid;

    ShowModelData({this.category, this.category_title, this.description, this.owner_address, this.owner_cell, this.favorit, this.gallery, this.hits, this.id, this.owner, this.owner_pic, this.summary, this.tages, this.title, this.uid});

    factory ShowModelData.fromJson(Map<String, dynamic> json) {
        return ShowModelData(
            category: json['category'], 
            category_title: json['category_title'], 
            description: json['description'], 
            gallery: json['gallery'] != null ? new List<String>.from(json['gallery']) : null, 
            hits: json['hits'], 
            id: json['id'],
            favorit: json['favorit'],
            owner_address: json['owner_address'],
            owner_cell: json['owner_cell'],
            owner: json['owner'],
            owner_pic: json['owner_pic'], 
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
        data['hits'] = this.hits;
        data['id'] = this.id;
        data['owner'] = this.owner;
        data['owner_pic'] = this.owner_pic;
        data['summary'] = this.summary;
        data['title'] = this.title;
        data['uid'] = this.uid;
        if (this.gallery != null) {
            data['gallery'] = this.gallery;
        }
        if (this.tages != null) {
            data['tages'] = this.tages;
        }
        return data;
    }
}