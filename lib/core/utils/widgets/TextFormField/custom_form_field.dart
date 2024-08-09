import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/utils/widgets/TextFormField/text_form_field_border.dart';
import 'package:task_management_app/provider/settings_provider.dart';

typedef FunctionValidate = String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? inputField;
  final FunctionValidate functionValidate;
  final bool obscureText;
  final TextInputType textInputType;
  final String? textLabel;
  final IconData? suffixIcon;
  final String? hintText;
  final String fontFamily;
  final InputBorder? borderField;
  final Function? onPressedSuffixIcon;
  final int maxLines;
  final int minLines;
  final IconData? prefixIcon;
  final String? initialValue;
  final FunctionValidate? functionOnChanged;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  const CustomTextFormField(
      {super.key,
        this.inputField,
        this.onSaved,
      required this.functionValidate,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
        this.textLabel,
      this.suffixIcon,
      this.fontFamily = "Poppins",
       this.borderField,
        this.onPressedSuffixIcon,
        this.maxLines = 1,
        this.minLines = 1,
        this.functionOnChanged,
        this.initialValue,
        this.textInputAction, this.hintText, this.prefixIcon
      });

  @override
  Widget build(BuildContext context) {
    var textThemeApp = Provider.of<SettingsProvider>(context).textThemeApp;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textLabel != null?Text(textLabel!,style: Theme.of(context).textTheme.titleMedium?.copyWith(letterSpacing: 1.5,decorationThickness: 0),):const SizedBox(),
         const SizedBox(height: 13),
        TextFormField(
          keyboardType: textInputType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          controller: inputField,
          validator: functionValidate,
          onSaved: onSaved??(newValue) {
            onSaved!(newValue);
          },
          maxLines: maxLines,
          onChanged: functionOnChanged,
          initialValue: initialValue,

          minLines: minLines,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(decorationThickness: 0),
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 13
            ),
            hintText: hintText,
            filled: true,
            enabled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 23),
            fillColor:  const Color(0xffffffff),
            hintStyle: textThemeApp.font15greyRegular,
            enabledBorder:fieldBorderDefault(color: const Color(0x679b9b9b)),
              border: fieldBorderDefault(color: Colors.white),
              focusedBorder:fieldBorderDefault(color: Theme.of(context).primaryColor),
              errorBorder:fieldBorderDefault(color: Colors.red),
            focusedErrorBorder:fieldBorderDefault(color: Colors.red),
            prefixIcon:Icon(prefixIcon),
            suffixIcon:suffixIcon !=null?IconButton(
              onPressed: (){
                onPressedSuffixIcon!();
              },
              icon: Icon(
                suffixIcon,
                color: Colors.grey,
              )
            ):null,
          )
        ),
      ],
    );
  }
}