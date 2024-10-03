
class TaskModel {
  String? title;
  String? desc;
  String? imageUrl;
  int? priority;
  int? status;
  String? taskId;
  DateTime? date;
  static const String collectionName = "Tasks";
  String? time;

  TaskModel({this.time,
    this.date,
    this.desc,
    this.imageUrl,
    this.status,
    this.priority,
    this.taskId,
    this.title});

  TaskModel.fromJson(Map<String, dynamic>? data){
    title = data?["title"];
    desc = data?["desc"];
    taskId = data?["taskId"];
    status = data?["status"];
    imageUrl = data?["imageUrl"];
    priority = data?["priority"];
    date = data?["date"]!=null?DateTime.fromMicrosecondsSinceEpoch(data?["date"]):null;
    time = data?["time"];
}
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "desc": desc,
      "priority": priority,
      "date": date?.microsecondsSinceEpoch,
      "time": time,
      "taskId": taskId,
      "status":status,
      "imageUrl": imageUrl
    };
  }
}