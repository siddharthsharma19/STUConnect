import 'package:STUConnect/screens/signin/signin.dart';
import 'package:STUConnect/screens/sis/sisdata.dart';

class SubjectInfo {
  late int position;
  late String subName;
  late String subCode;
  late String test1;
  late String test2;
  late String assignment1;
  late String assignment2;
  late String cie;
  late String attendance;
  late String for85;
  late String for75;

  SubjectInfo(this.position,
      {required this.subName,
      required this.subCode,
      required this.test1,
      required this.test2,
      required this.assignment1,
      required this.assignment2,
      required this.cie,
      required this.attendance,
      required this.for75,
      required this.for85});
}

List<SubjectInfo> subjects = [
  SubjectInfo(1,
      subName: 'Engineering Mathematics-III',
      subCode: 'CS41',
      test1: '28',
      test2: '30',
      assignment1: '10',
      assignment2: '10',
      cie: '49',
      attendance: '75%',
      for75: '5',
      for85: '8'),
  SubjectInfo(2,
      subName: 'EngMath',
      subCode: 'CS42',
      test1: '28',
      test2: '30',
      assignment1: '10',
      assignment2: '10',
      cie: '49',
      attendance: '75%',
      for75: '5',
      for85: '8'),
  SubjectInfo(3,
      subName: 'EngMath',
      subCode: 'CS43',
      test1: '28',
      test2: '30',
      assignment1: '10',
      assignment2: '10',
      cie: '49',
      attendance: '75%',
      for75: '5',
      for85: '8'),
  SubjectInfo(4,
      subName: 'EngMath',
      subCode: 'CS44',
      test1: '28',
      test2: '30',
      assignment1: '10',
      assignment2: '10',
      cie: '49',
      attendance: '75%',
      for75: '5',
      for85: '8'),
  SubjectInfo(5,
      subName: 'EngMath',
      subCode: 'CS45',
      test1: '28',
      test2: '30',
      assignment1: '10',
      assignment2: '10',
      cie: '49',
      attendance: '75%',
      for75: '5',
      for85: '8'),
  SubjectInfo(6,
      subName: 'EngMath',
      subCode: 'CS46',
      test1: '28',
      test2: '30',
      assignment1: '10',
      assignment2: '10',
      cie: '49',
      attendance: '75%',
      for75: '5',
      for85: '8'),
];
