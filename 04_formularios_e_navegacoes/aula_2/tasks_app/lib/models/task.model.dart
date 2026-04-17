class Task {
  String title;
  String? description;
  bool completed;
  bool important;

  Task({required this.title, this.description, this.important = false})
    : completed = false;
}
