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
import 'package:task_management_app/features/tasks_management/presentation/view/taps/display_tasks/view/widgets/priority_item.dart';
import 'package:task_management_app/material_application.dart';
import '../../../../../../../../core/utils/widgets/loading/custom_hexagon_Dots_loading.dart';
import '../../../../../../data/models/task_model.dart';
import '../../cubits/control_tasks_cubit/control_tasks_cubit.dart';
import 'build_under_line_input_border.dart';

class ShowBottomSheetAddTask extends StatefulWidget {
  const ShowBottomSheetAddTask({super.key, required this.categoryId, required this.userID});
  final String categoryId;
  final String userID;
  @override
  State<ShowBottomSheetAddTask> createState() => _ShowBottomSheetAddTaskState();
}

class _ShowBottomSheetAddTaskState extends State<ShowBottomSheetAddTask> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  final List<Color> importance = const [
    Color(0xffff0000),
    Color(0xffff9900),
    Color(0xffffff00),
    Color(0xff7fff00),
    Color(0xff007fff),
    Color(0xffe5e5e5),
  ];
  int? selectedItemPriority;
  var formKey = GlobalKey<FormState>();
  Time? time;
  bool? pickImageIsNotNull;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 28.0, right: 8, left: 8, bottom: 10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.add_task,
                style: textThemeApp.font17PrimaryMedium.copyWith(fontSize: 21),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: AppLocalizations.of(context)!.ex_sport,
                textInputAction: TextInputAction.next,
                textLabel: AppLocalizations.of(context)!.title_task,
                inputField: titleController,
                functionValidate: (text) {
                  return ValidateInputsFromTextValid.validateNameValid(input: text,outPut: "task name");
                },
                borderField: buildUnderlineInputBorder(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: AppLocalizations.of(context)!
                    .i_am_going_to_play_sports_with_my_colleagues,
                textInputAction: TextInputAction.next,
                textLabel: AppLocalizations.of(context)!.description,
                inputField: descController,
                minLines: 2,
                maxLines: 3,
                functionValidate: (text) {
                  return ValidateInputsFromTextValid.validateNameValid(input: text,outPut: "task description");
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
              Column(
                children: [


                SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          selectedItemPriority = index;
                          setState(() {});
                        },
                        child: PriorityItem(
                          number: index,
                          color: importance[index],
                          isSelected: index == selectedItemPriority,
                        )),
                    itemCount: importance.length),
              ),


                  const SizedBox(height: 10),
                  selectedItemPriority == -1
                      ? Text(
                    AppLocalizations.of(context)!.please_enter_priority,
                    style:
                    const TextStyle(color: Colors.red, fontSize: 13),
                  )
                      : const SizedBox()
                ],
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
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 1),
                    lastDate: DateTime(DateTime.now().year + 1),
                    borderRadius: 10,
                  );
                },
                child: Column(
                  children: [
                    Text(
                      date == null || date?.year == 1111
                          ? AppLocalizations.of(context)!.select_date
                          : "${date?.day} / ${date?.month} / ${date?.year}",
                      textAlign: TextAlign.center,
                      style: textThemeApp.font17PrimaryMedium,
                    ),
                    const SizedBox(height: 10),
                    date?.year == 1111
                        ? Text(
                      AppLocalizations.of(context)!.please_enter_the_date,
                      style: const TextStyle(
                          color: Colors.red, fontSize: 13),
                    )
                        : const SizedBox()
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
                      value: time == null || time?.hour == 100
                          ? Time(
                          hour: DateTime.now().hour,
                          minute: DateTime.now().hour)
                          : time!,
                      sunrise: const TimeOfDay(hour: 6, minute: 0),
                      // optional
                      sunset: const TimeOfDay(hour: 18, minute: 0),
                      // optional
                      duskSpanInMinutes: 120,
                      // optional
                      onChange: (Time time) {
                        this.time = time;
                        this.time?.second = 0;
                        print(time.format(context));
                        setState(() {});
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      time == null || time?.second == 10
                          ? AppLocalizations.of(context)!.select_time
                          : "${time?.format(context)}",
                      style: textThemeApp.font17PrimaryMedium,
                    ),
                    const SizedBox(height: 10),
                    time?.second == 10
                        ? Text(
                      AppLocalizations.of(context)!.please_enter_the_time,
                      style: const TextStyle(
                          color: Colors.red, fontSize: 13),
                    )
                        : const SizedBox()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async{
                await addTask();
              },style: ElevatedButton.styleFrom(backgroundColor: primaryColorApp),
                  child: BlocConsumer<ControlTasksCubit,ControlTasksState>(
                    listener: (context, state) async {
                      if(state is AddTaskFailure){
                        GoRouter.of(context).pop();
                         showMessageWithSnackBar(background: primaryColorApp, message: state.errorMessage, context: context);
                      }else if(state is AddTaskSuccess){
                        GoRouter.of(context).pop();
                        showMessageWithSnackBar(background: primaryColorApp, message: "The task has been added successfully.", context: context);
                      }
                    },
                    builder: (context, state) {
                      if(state is AddTaskLoading){
                        return CustomHexagonDotsLoading(color: textThemeApp.secondPrimaryColor);
                      }
                      return Text("Add Task", style: textThemeApp.font18SecondPrimaryBold,);
                    },
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addTask() async {
    print("formKey.currentState?.validate()");
    if (formKey.currentState?.validate() == false) return;

    if (selectedItemPriority == null) {
      selectedItemPriority = -1;
      return;
    }
    if (date == null) {
      date = DateTime(1111);
      return;
    }
    if (time == null) {
      time = Time(second: 10, hour: 1, minute: 1);
      return;
    }

    TaskModel taskModel = TaskModel(
      title: titleController.text,
      time: time?.format(context),
      desc: descController.text,
      status: 0,
      date: DateTime(date!.year, date!.month, date!.day),
      priority: selectedItemPriority,
    );
    // print("title = ${taskModel.title}");
    // print("time = ${taskModel.time}");
    // print("desc = ${taskModel.desc}");
    // print("status = ${taskModel.status}");
    // print("date = ${taskModel.date}");
    // print("priority = ${taskModel.status}");

    await BlocProvider.of<ControlTasksCubit>(context).addTaskInDatabase(uid: widget.userID, taskModel: taskModel, categoryId: widget.categoryId);

    setState(() {});
  }
}

