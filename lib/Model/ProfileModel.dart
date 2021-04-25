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
  String lat;
  String lng;
  int level;
  String levelTitle;
  String expire;
  List<Interest> interest;
  List<ActivityScope> activityScope;
  String pic;
  String thumb;
  String nationalCode;
  String postalCode;

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
      this.lat,
      this.lng,
      this.level,
      this.levelTitle,
      this.expire,
      this.interest,
      this.activityScope,
      this.pic,
      this.thumb,
      this.nationalCode,
      this.postalCode});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['User'];
    status = json['Status'];
    name = json['Name'];
    tell = json['Tell'];
    cell = json['Cell'];
    email = json['Email'];
    ostan = json['Ostan'];
    city = json['City'];
    address = json['Address'];
    lat = json['lat'];
    lng = json['lng'];
    level = json['level'];
    levelTitle = json['level_title'];
    expire = json['Expire'];
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
    pic = json['Pic'];
    thumb = json['Thumb'];
    nationalCode = json['NationalCode'];
    postalCode = json['PostalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['User'] = this.user;
    data['Status'] = this.status;
    data['Name'] = this.name;
    data['Tell'] = this.tell;
    data['Cell'] = this.cell;
    data['Email'] = this.email;
    data['Ostan'] = this.ostan;
    data['City'] = this.city;
    data['Address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['level'] = this.level;
    data['level_title'] = this.levelTitle;
    data['Expire'] = this.expire;
    if (this.interest != null) {
      data['interest'] = this.interest.map((v) => v.toJson()).toList();
    }
    if (this.activityScope != null) {
      data['activity_scope'] =
          this.activityScope.map((v) => v.toJson()).toList();
    }
    data['Pic'] = this.pic;
    data['Thumb'] = this.thumb;
    data['NationalCode'] = this.nationalCode;
    data['PostalCode'] = this.postalCode;
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