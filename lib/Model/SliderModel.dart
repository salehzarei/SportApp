class SliderModel {
    int id;
    String link;
    String pic;
    String title;

    SliderModel({this.id, this.link, this.pic, this.title});

    factory SliderModel.fromJson(Map<String, dynamic> json) {
        return SliderModel(
            id: json['id'],
            link: json['link'],
            pic: json['pic'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['link'] = this.link;
        data['pic'] = this.pic;
        data['title'] = this.title;
        return data;
    }
}