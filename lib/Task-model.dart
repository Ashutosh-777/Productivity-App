class taskmodel{
  String title;
  String description;
  String deadline;
  String category;
  String ID;
  bool iscompleted;
  taskmodel({
    required this.title,
    required this.category,
    required this.deadline,
    required this.description,
    required this.ID,
    required this.iscompleted,
});
  Map<String,dynamic> toJson() {
    return {
      'title':title,
      'description':description,
      'deadline': deadline,
      'category':category,
      'ID':ID,
      'iscompleted':iscompleted,
    };
  }
  static taskmodel fromjson(Map<String,dynamic> json){
    return taskmodel(
        title: json['title'],
      category: json['category'],
      deadline: json['deadline'],
      description: json['description'],
      ID: json['ID'],
      iscompleted: json['iscompleted']

    );
  }
}