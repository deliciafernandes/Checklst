class Reminder {
  String title;
  String description;
  String date;
  String time;
  var userLocation;

  bool isDone;

  void toggleDone() {
    isDone = !isDone;
  }

  Reminder(
      {this.title,
      this.description,
      this.date,
      this.time,
      this.userLocation,
      this.isDone = false});
}
