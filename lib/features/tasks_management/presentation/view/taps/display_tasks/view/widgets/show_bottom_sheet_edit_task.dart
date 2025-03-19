import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/functions/validate/validate_inputs_from_text_valid.dart';
import 'package:task_management_app/core/utils/style/theme/constant_colors.dart';
import 'package:task_management_app/core/utils/widgets/TextFormField/custom_form_field.dart';
import 'package:task_management_app/core/utils/widgets/dialogs/show_message_with_snack_bar.dart';
import 'package:task_management_app/core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/priority_item.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../../data/models/task_model.dart';
import '../../cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'build_under_line_input_border.dart';

class ShowBottomSheetEditTask extends StatefulWidget {
  const ShowBottomSheetEditTask({super.key, required this.categoryId, required this.userID, required this.taskModel});
  final String categoryId;
  final TaskModel taskModel;
  final String userID;
  @override
  State<ShowBottomSheetEditTask> createState() => _ShowBottomSheetEditTaskState(categoryId: categoryId,taskModel: taskModel,userID: userID);
}

class _ShowBottomSheetEditTaskState extends State<ShowBottomSheetEditTask> {
  _ShowBottomSheetEditTaskState({required String categoryId, required String userID,required TaskModel taskModel}){
    print("_ShowBottomSheetEditTaskState $categoryId - $userID - ${taskModel.toString()}");
    initialValues(categoryId: categoryId, userID: userID, taskModel: taskModel);
  }
  void initialValues({required String categoryId, required String userID,required TaskModel taskModel}){
    selectedItemPriority = taskModel.priority??0;
    date = taskModel.date!;
    print("ppp : ${taskModel.time!.substring(0,(taskModel.time!.indexOf(':')))}");
    hour = int.parse(taskModel.time!.substring(0,(taskModel.time!.indexOf(':'))));
    print("ppp : ${taskModel.time!.substring((taskModel.time!.indexOf(":") + 1), taskModel.time!.length-3)}");
    minute = int.parse(taskModel.time!.substring((taskModel.time!.indexOf(":") + 1), taskModel.time!.length-3));
    time = Time.fromTimeOfDay(Time(hour:hour,minute: minute), 0);
  }
  late int hour;
  late int minute;
  final List<Color> importance = const [
    Color(0xffff0000),
    Color(0xffff9900),
    Color(0xffffff00),
    Color(0xff7fff00),
    Color(0xff007fff),
    Color(0xffe5e5e5),
  ];
  late var selectedItemPriority;
  var formKey = GlobalKey<FormState>();
  Time time = Time(hour: 0, minute: 0);
  late DateTime date;

  @override
  Widget build(BuildContext context) {
    var controlTasksCubit = BlocProvider.of<ControlTasksCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0, right: 8, left: 8, bottom: 10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.edit_task,
                style: textThemeApp.font17PrimaryMedium.copyWith(fontSize: 21),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: AppLocalizations.of(context)!.ex_sport,
                textInputAction: TextInputAction.next,
                initialValue: widget.taskModel.title,
                textLabel: AppLocalizations.of(context)!.title_task,
                functionValidate: (text)  {
                  if(text != widget.taskModel.title){
                    if(ValidateInputsFromTextValid.validateNameValid(input: text,outPut: "task name") == null){
                       controlTasksCubit.editFieldsInTaskInDatabase(taskId: widget.taskModel.taskId!, categoryId: widget.categoryId, uid: widget.userID, newData: {"title":text});
                    }else{
                      return ValidateInputsFromTextValid.validateNameValid(input: text,outPut: "task name");
                    }
                  }
                  return null;
                },
                borderField: buildUnderlineInputBorder(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: AppLocalizations.of(context)!.i_am_going_to_play_sports_with_my_colleagues,
                textInputAction: TextInputAction.next,
                initialValue: widget.taskModel.desc,
                textLabel: AppLocalizations.of(context)!.description,
                minLines: 2,
                maxLines: 3,
                functionValidate: (text) {
                  if(text != widget.taskModel.desc){
                    if(ValidateInputsFromTextValid.validateNameValid(input: text,outPut: "task description") == null){
                      controlTasksCubit.editFieldsInTaskInDatabase(taskId: widget.taskModel.taskId!, categoryId: widget.categoryId, uid: widget.userID, newData: {"desc":text});
                    }else{
                      return ValidateInputsFromTextValid.validateNameValid(input: text,outPut: "task description");
                    }
                  }
                  return null;
                },
                borderField: buildUnderlineInputBorder(),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.priority,
                style: textThemeApp.font17PrimaryMedium,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true, itemBuilder: (context, index) => InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          selectedItemPriority = index;
                          setState(() {});
                        }, child: PriorityItem(
                          number: index,
                          color: importance[index],
                          isSelected: index == selectedItemPriority,
                        )),
                    itemCount: importance.length),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.date,
                style: textThemeApp.font17PrimaryMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await showRoundedDatePicker(
                    onTapDay: (DateTime dateTime, bool _) {
                      print(dateTime);
                      date = dateTime;
                      setState(() {});
                      return true;
                    },
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 1),
                    borderRadius: 10,
                  );
                },
                child: Column(
                  children: [
                    Text(
                       "${date.day} / ${date.month} / ${date.year}",
                      textAlign: TextAlign.center,
                      style: textThemeApp.font17PrimaryMedium,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.time,
                style: textThemeApp.font17PrimaryMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(shadowColor: Colors.transparent,
                    overlayColor: Colors.transparent),
                onPressed: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value:time,
                      sunrise: const TimeOfDay(hour: 6, minute: 0),
                      // optional
                      sunset: const TimeOfDay(hour: 18, minute: 0),
                      // optional
                      duskSpanInMinutes: 120,
                      // optional
                      onChange: (Time time) {
                        this.time = time;
                        this.time.second = 0;
                        print(time.format(context));
                        setState(() {});
                      },
                    ),
                  );
                },
                child: Text(
                   time.format(context), style: textThemeApp.font17PrimaryMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async{
                await editTask();
              },style: ElevatedButton.styleFrom(backgroundColor: primaryColorApp),
                child: BlocConsumer<ControlTasksCubit, ControlTasksState>(
                  listener: (context, state) {
                    if(state is EditTaskSuccess){
                      GoRouter.of(context).pop();
                      showMessageWithSnackBar(background: primaryColorApp, message: "The task has been added successfully.", context: context);                    }
                   },builder: (context, state) {
                    if(state is EditTaskLoading){
                      return const CustomHexagonDotsLoading(color: Colors.white);
                    }
                      return Text("Save Changes", style: textThemeApp.font18SecondPrimaryBold);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editTask() async {
    if (formKey.currentState!.validate() == true) ;

    if (selectedItemPriority != widget.taskModel.priority) {
      await BlocProvider.of<ControlTasksCubit>(context).editFieldsInTaskInDatabase(taskId: widget.taskModel.taskId!, categoryId: widget.categoryId, uid: widget.userID, newData: {"priority": selectedItemPriority});
    }
    if (date.microsecondsSinceEpoch != widget.taskModel.date?.microsecondsSinceEpoch) {
      await BlocProvider.of<ControlTasksCubit>(context).editFieldsInTaskInDatabase(taskId: widget.taskModel.taskId!, categoryId: widget.categoryId, uid: widget.userID, newData: {"date": date.microsecondsSinceEpoch});
    }
    if (time.hour !=  hour || time.minute != minute) {
      print("jj : ${time.format(context)}");
      await BlocProvider.of<ControlTasksCubit>(context).editFieldsInTaskInDatabase(taskId: widget.taskModel.taskId!, categoryId: widget.categoryId, uid: widget.userID, newData: {"time": time.format(context)});
    }
    setState(() {});
  }
}
