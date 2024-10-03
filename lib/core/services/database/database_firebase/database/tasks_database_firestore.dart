import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  List<TaskModel> listenToTasksFromTheDatabase({required String categoryId,required String uid, required DateTime dateTime})  {
    List<TaskModel> tasks = [];
     getTasksCollection(uid: uid,categoryId: categoryId).where('date', isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).orderBy("priority")
        .snapshots().listen((event) {
          List<TaskModel> tasks = [];
          for (var element in event.docs) {
            tasks.add(element.data());
          }
        },);
     return tasks;
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
  List<TaskModel> listenToTasksFromTheDatabaseUsingFilter({required String categoryId, required String uid,required int status, required DateTime dateTime}) {
    List<TaskModel> tasks = [];
    getTasksCollection(categoryId: categoryId,uid: uid).where('date',
        isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).where("status",isEqualTo: status).snapshots().listen((event) {
          for (var element in event.docs) {
            tasks.add(element.data());
          }
        },
    );
    return tasks;
  }
}