import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/functions/custom_typedef.dart';
import '../../../../../features/tasks_management/data/models/task_model.dart';
import '../../database_services/database_interface/tasks_database.dart';
import 'categories_database_firestore.dart';

class TasksDatabaseFirestore implements TasksDatabase{
  CollectionReference<TaskModel> getTasksCollection({required String uid, required String categoryId}){
    return CategoriesDatabaseFirestore().getCategoriesCollection(uid: uid).doc(categoryId).collection(TaskModel.collectionName)
        .withConverter(
        fromFirestore: (snapshot, options) => TaskModel.fromJson(snapshot.data()),
        toFirestore: (value, options) => value.toJson(),
    );
  }
  @override
  Future<String?> addTaskInDatabase({required String uid,required TaskModel taskModel, required String categoryId}) async {
   var documentReference = getTasksCollection(uid: uid, categoryId: categoryId).doc();
   taskModel.taskId = documentReference.id;
   await documentReference.set(taskModel);
   return taskModel.taskId;
  }

  @override
  Future<void> editFieldsInTaskInDatabase({required String taskId, required String categoryId,required String uid,required Map<String,dynamic>newData}) async {
    await getTasksCollection(categoryId: categoryId, uid: uid).doc(taskId).update(newData);
  }

  @override
  Future<void> deleteTaskFromDatabase({required String uid, required String categoryId,required String taskID})async {
    await getTasksCollection(categoryId: categoryId, uid: uid).doc(taskID).delete();
  }

  @override
  Future<List<TaskModel>> fetchTasksByStatus({required String categoryId, required int status, required String uid, required DateTime dateTime}) async{
    List<TaskModel> items = [];
    var res = await getTasksCollection(uid: uid, categoryId: categoryId).where("status",isEqualTo: status).where("date",isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).orderBy("priority").get();
    res.docs.forEach((element) {
      items.add(element.data());
    },);
    return items;
  }
  @override
  Future<List<TaskModel>> fetchTasksByDate({required String categoryId, required String uid, required DateTime dateTime})async {
    List<TaskModel> items = [];
    var res = await getTasksCollection(uid: uid, categoryId: categoryId).where("date",isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).orderBy("priority").get();
    res.docs.forEach((element) {
      items.add(element.data());
    },);

    return items;
  }

  @override
  Future<void> trackCompletedTasksToday({required String categoryId, required String uid, required int dateTime,required EventFunctionAsync eventFunction}) async {
    print("date time since epoch trackCompletedTasksToday: $dateTime");
    getTasksCollection(uid: uid, categoryId: categoryId).where('date',isEqualTo: dateTime).where("status",isEqualTo: 2).snapshots().listen((event)async {
      print("trackCompletedTasksToday : ${event.docs.length}");
      await eventFunction(event.docs.length);
    },);
  }

  @override
  Future<void> trackTodayTaskCount({required String categoryId, required String uid, required int dateTime,required EventFunctionAsync eventFunction}) async {
    getTasksCollection(uid: uid, categoryId: categoryId).where('date',isEqualTo: dateTime).snapshots().listen((event) async{
      print("trackTodayTaskCount : ${event.docs.length}");
      await eventFunction(event.docs.length);
    },);
  }

  @override
  Future<void> trackInformationAboutTasks({required String categoryId, required int status, required String uid, required DateTime dateTime,required EventFunctionAsync eventFunctionTrackCompletedTasksToday,required EventFunctionAsync eventFunctionTrackTodayTaskCount}) async{
    await trackTodayTaskCount(categoryId: categoryId,dateTime: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch,uid: uid,eventFunction: eventFunctionTrackTodayTaskCount);
    await trackCompletedTasksToday(categoryId: categoryId,dateTime:DateUtils.dateOnly(dateTime).microsecondsSinceEpoch ,uid: uid,eventFunction: eventFunctionTrackCompletedTasksToday);
  }

  @override
  Future<TaskModel?> fetchASpecificTask({required String uid, required String taskId, required String categoryId}) async{
    var res = await getTasksCollection(uid: uid, categoryId: categoryId).doc(taskId).get();
    return res.data();
  }
}