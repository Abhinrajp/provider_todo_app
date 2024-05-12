class Todomodel {
  int? id;
  final String title;
  final String content;
  final String enddate;

  Todomodel(
      {this.id,
      required this.title,
      required this.content,
      required this.enddate});
}
