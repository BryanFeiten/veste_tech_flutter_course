class Task {
  final String title;
  final String description;
  bool _starred;
  bool _done;

  bool get starred => _starred;
  bool get done => _done;

  void toggleStarred() {
    _starred = !_starred;
  }

  void toggleDone() {
    _done = !_done;
  }

  Task({
    required this.title,
    required this.description,
    bool starred = false,
    bool done = false,
  }) : _starred = starred,
       _done = done;
}
