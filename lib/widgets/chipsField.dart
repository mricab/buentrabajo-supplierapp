import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';

class ChipsController {
  //https://stackoverflow.com/questions/18258267/is-there-a-way-to-pass-a-primitive-parameter-by-reference-in-dart
  List<String> data;
  ChipsController(this.data);
}

class ChipsField extends FormField<List<String>> {
  ChipsField({
    List<String> options,
    FormFieldValidator<List<String>> validator,
    ChipsController controller,
  }) : super(
          initialValue: null,
          onSaved: (val) {
            controller.data = val;
            print(controller.data);
          },
          validator: validator,
          builder: (state) {
            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: ChipsChoice<String>.multiple(
                    value: state.value,
                    onChanged: (val) {
                      state.didChange(val);
                      state.save();
                    },
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options,
                      value: (i, v) => v.toLowerCase(),
                      label: (i, v) => v,
                      tooltip: (i, v) => v,
                    ),
                    choiceStyle: const C2ChoiceStyle(
                      color: Colors.indigo, //Text and border color
                      borderOpacity: .3,
                    ),
                    choiceActiveStyle: const C2ChoiceStyle(
                      color: Colors.indigo,
                      brightness: Brightness.dark,
                    ),
                    wrapped: true,
                  ),
                ),
                state.hasError
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          state.errorText ?? 'nothing selected',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
              ],
            );
          },
        );
}
