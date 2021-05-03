class DividerModel {
    List<Content> content;

    DividerModel({this.content});

    factory DividerModel.fromJson(Map<String, dynamic> json) {
        return DividerModel(
            content: json['content'] != null ? (json['content'] as List).map((i) => Content.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.content != null) {
            data['content'] = this.content.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Content {
    String controller;
    String link;
    String pic;

    Content({this.controller, this.link, this.pic});

    factory Content.fromJson(Map<String, dynamic> json) {
        return Content(
            controller: json['controller'], 
            link: json['link'], 
            pic: json['pic'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['controller'] = this.controller;
        data['link'] = this.link;
        data['pic'] = this.pic;
        return data;
    }
}