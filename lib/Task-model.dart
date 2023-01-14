class taskmodel{
  String title;
  String description;
  String deadline;
  String category;
  taskmodel({
    required this.title,
    required this.category,
    required this.deadline,
    required this.description,
});
  Map<String,dynamic> toJson() {
    return {
      'title':title,
      'description':description,
      'deadline': deadline,
      'category':category,
    };
  }
  static taskmodel fromjson(Map<String,dynamic> json){
    return taskmodel(
        title: json['title'],
      category: json['category'],
      deadline: json['deadline'],
      description: json['description'],

    );
  }
}