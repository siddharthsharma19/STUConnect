class ResultInfo {
  final int position;
  final double cgpa;
  final double sgpa;
  ResultInfo(this.position, {required this.cgpa, required this.sgpa});
}

List<ResultInfo> semRes = [
  ResultInfo(1, cgpa: 8.85, sgpa: 8.85),
  ResultInfo(2, cgpa: 9.85, sgpa: 9.35),
  ResultInfo(3, cgpa: 8.6, sgpa: 9.06),
  ResultInfo(4, cgpa: 9, sgpa: 9.07),
];
