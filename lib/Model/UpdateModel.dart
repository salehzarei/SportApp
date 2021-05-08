class UpdateModel {
    String download_link;
    bool update_required;
    String version;

    UpdateModel({this.download_link, this.update_required, this.version});

    factory UpdateModel.fromJson(Map<String, dynamic> json) {
        return UpdateModel(
            download_link: json['download_link'], 
            update_required: json['update_required'], 
            version: json['version'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['download_link'] = this.download_link;
        data['update_required'] = this.update_required;
        data['version'] = this.version;
        return data;
    }
}