
class User{
  String regController;
  String plotController ;
  String pController ;
  String add1Controller ;
  String add2Controller;
  String add3Controller;
  bool dataAdded;

  User(
      this.regController,
      this.plotController,
      this.pController,
      this.add1Controller,
      this.add2Controller,
      this.add3Controller,
      this.dataAdded);

  User.fromJson(Map<String,dynamic> json) : regController = json['regController'],
  pController = json['pController'],
  plotController = json['plotController'],
  add1Controller = json['add1Controller'],
  add2Controller = json['add2Controller'],
  add3Controller = json['add3Controller'],
  dataAdded = json['dataAdded'];

  Map<String,dynamic> toJson() => {
    'regController': regController,
    'plotController':plotController,
    'pController': pController,
    'add1Controller':add1Controller,
    'add2Controller':add2Controller,
    'add3Controller':add3Controller,
    'dataAdded':dataAdded
  };
}