class AboutModel {
    String data;
    List<Social> social;

    AboutModel({this.data, this.social});

    factory AboutModel.fromJson(Map<String, dynamic> json) {
        return AboutModel(
            data: json['data'],
            social: json['social'] != null ? (json['social'] as List).map((i) => Social.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['data'] = this.data;
        if (this.social != null) {
            data['social'] = this.social.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Social {
    String icon;
    String link;
    String title;

    Social({this.icon, this.link, this.title});

    factory Social.fromJson(Map<String, dynamic> json) {
        return Social(
            icon: json['icon'], 
            link: json['link'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['icon'] = this.icon;
        data['link'] = this.link;
        data['title'] = this.title;
        return data;
    }
}