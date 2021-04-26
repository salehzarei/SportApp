class UserDataModel {
  int id;
  String user;
  int status;
  String name;
  String tell;
  String cell;
  String email;
  int ostan;
  int city;
  String address;
  String description;
  String lat;
  String lng;
  int level;
  String levelTitle;
  String expire;
  List<Interest> interest;
  List<ActivityScope> activityScope;
  String pic;
  String thumb;

  UserDataModel(
      {this.id,
      this.user,
      this.status,
      this.name,
      this.tell,
      this.cell,
      this.email,
      this.ostan,
      this.city,
      this.address,
      this.description,
      this.lat,
      this.lng,
      this.level,
      this.levelTitle,
      this.expire,
      this.interest,
      this.activityScope,
      this.pic,
      this.thumb});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    status = json['status'];
    name = json['name'];
    tell = json['tell'];
    cell = json['cell'];
    email = json['email'];
    ostan = json['ostan'];
    description = json['description'];
    city = json['city'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    level = json['level'];
    levelTitle = json['level_title'];
    expire = json['expire'];
    if (json['interest'] != null) {
      interest = new List<Interest>();
      json['interest'].forEach((v) {
        interest.add(new Interest.fromJson(v));
      });
    }
    if (json['activity_scope'] != null) {
      activityScope = new List<ActivityScope>();
      json['activity_scope'].forEach((v) {
        activityScope.add(new ActivityScope.fromJson(v));
      });
    }
    pic = json['pic'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['status'] = this.status;
    data['name'] = this.name;
    data['tell'] = this.tell;
    data['cell'] = this.cell;
    data['email'] = this.email;
    data['ostan'] = this.ostan;
    data['city'] = this.city;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['level'] = this.level;
    data['level_title'] = this.levelTitle;
    data['expire'] = this.expire;
    if (this.interest != null) {
      data['interest'] = this.interest.map((v) => v.toJson()).toList();
    }
    if (this.activityScope != null) {
      data['activity_scope'] =
          this.activityScope.map((v) => v.toJson()).toList();
    }
    data['pic'] = this.pic;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Interest {
  int id;
  String title;

  Interest({this.id, this.title});

  Interest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
class ActivityScope {
  int id;
  String title;

  ActivityScope({this.id, this.title});

  ActivityScope.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}