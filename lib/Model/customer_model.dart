class CustomerModel {
  String email;
  String cnic;
  String password;

  CustomerModel({this.email,this.cnic, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'email': email,
      'cnic': cnic,
      'password': password,
      'username': email,
    });
    return map;
  }
}