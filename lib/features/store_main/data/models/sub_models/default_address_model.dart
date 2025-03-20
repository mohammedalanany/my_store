class DefaultAddressModel {
  int? id;
  String? street;
  String? addressType;
  String? longitude;
  String? latitude;
  String? lat;
  String? lng;
  Null region;
  Null state;
  Null user;

  DefaultAddressModel(
      {this.id,
      this.street,
      this.addressType,
      this.longitude,
      this.latitude,
      this.lat,
      this.lng,
      this.region,
      this.state,
      this.user});

  DefaultAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    addressType = json['address_type'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    lat = json['lat'];
    lng = json['lng'];
    region = json['region'];
    state = json['state'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['address_type'] = this.addressType;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['region'] = this.region;
    data['state'] = this.state;
    data['user'] = this.user;
    return data;
  }
}
