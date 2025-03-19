part of 'control_tasks_cubit.dart';

@immutable
sealed class ControlTasksState {}

final class ControlTasksInitial extends ControlTasksState {}

final class AddTaskFailure extends ControlTasksState {
  final String errorMessage;
  AddTaskFailure({required this.errorMessage});
}

final class AddTaskLoading extends ControlTasksState {}

final class AddTaskSuccess extends ControlTasksState {}

final class DeleteTaskFailure extends ControlTasksState {
  final String errorMessage;
  DeleteTaskFailure({required this.errorMessage});
}

final class DeleteTaskLoading extends ControlTasksState {}

final class DeleteTaskSuccess extends ControlTasksState {}

final class FetchTasksFailure extends ControlTasksState {
  final String errorMessage;
  FetchTasksFailure({required this.errorMessage});
}

final class EditTaskLoading extends ControlTasksState {}

final class EditTaskSuccess extends ControlTasksState {
  final TaskModel? taskModel;
  EditTaskSuccess({this.taskModel});
}
final class UpdateTaskSuccess extends ControlTasksState {
  final TaskModel? taskModel;
  UpdateTaskSuccess({this.taskModel});
}
final class EditTaskFailure extends ControlTasksState {
  final String errorMessage;
  EditTaskFailure({required this.errorMessage});
}

final class FetchTasksLoading extends ControlTasksState {}


final class FetchTasksIsEmpty extends ControlTasksState {}

final class FetchTasksSuccess extends ControlTasksState {
  final List<TaskModel>? tasks;
  FetchTasksSuccess({this.tasks});
}