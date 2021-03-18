import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

class ChipsController {
  //https://stackoverflow.com/questions/18258267/is-there-a-way-to-pass-a-primitive-parameter-by-reference-in-dart
  List<String> data;
  ChipsController(this.data);
}

class ChipsField extends FormField<List<String>> {
  ChipsField({
    List<Map<String, String>> options,
    FormFieldValidator<List<String>> validator,
    ChipsController controller,
    bool wrapped = false,
  }) : super(
          initialValue: controller.data,
          onSaved: (val) {
            controller.data = val;
          },
          validator: validator,
          builder: (state) {
            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: ChipsChoice<String>.multiple(
                    value: state.value,
                    alignment: WrapAlignment.center,
                    onChanged: (val) {
                      state.didChange(val);
                      state.save();
                    },
                    choiceItems: C2Choice.listFrom<String, dynamic>(
                      source: options,
                      value: (i, v) => v['id'],
                      label: (i, v) => v['name'],
                      tooltip: (i, v) => v['name'],
                    ),
                    choiceStyle: const C2ChoiceStyle(
                      color: Colors.indigo, //Text and border color
                      borderOpacity: .3,
                    ),
                    choiceActiveStyle: const C2ChoiceStyle(
                      color: Colors.indigo,
                      brightness: Brightness.dark,
                    ),
                    wrapped: wrapped,
                  ),
                ),
                state.hasError
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          state.errorText ?? 'Nothing selected',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
              ],
            );
          },
        );
}
