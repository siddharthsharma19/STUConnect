class SubjectModel {
  bool success;
  String msg;
  String username;
  List<dynamic> sub;
  List<dynamic> subcode;
  List<dynamic> test1marks;
  List<dynamic> test2marks;
  List<dynamic> aq1marks;
  List<dynamic> aq2marks;
  List<dynamic> ciemarks;
  List<dynamic> attendance;
  List<dynamic> for75;
  List<dynamic> for85;
  List<dynamic> cgpa;
  List<dynamic> sgpa;

  SubjectModel(
      {required this.success,
      required this.msg,
      required this.username,
      required this.sub,
      required this.subcode,
      required this.test1marks,
      required this.test2marks,
      required this.aq1marks,
      required this.aq2marks,
      required this.ciemarks,
      required this.attendance,
      required this.for75,
      required this.for85,
      required this.cgpa,
      required this.sgpa});
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      success: json['success'],
      msg: json['msg'],
      username: json['username'],
      sub: json['sub'],
      subcode: json['subcode'],
      test1marks: json['test1marks'],
      test2marks: json['test2marks'],
      aq1marks: json['aq1marks'],
      aq2marks: json['aq2marks'],
      ciemarks: json['ciemarks'],
      attendance: json['attendance'],
      for75: json['for75'],
      for85: json['for85'],
      cgpa: json['cgpa'],
      sgpa: json['sgpa'],
    );
  }
}
