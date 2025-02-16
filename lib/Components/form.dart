import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// create an interface for the form props
class FormProps {
  late List<Label> labels;
  late Function onSubmit;

  FormProps({required this.labels, required this.onSubmit});
}

// create an enum for the labels types
enum LabelType {
  text,
  password,
  number,
}

class Label {
  late String label;
  late LabelType type;
  // ...

  Label({required this.label, required this.type});
}

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.props});

  final FormProps props;

  @override
  State<CustomForm> createState() => _FormState();
}

class _FormState extends State<CustomForm> {
  late Map<String, String> values = {};

  @override
  void initState() {
    super.initState();
    values = widget.props.labels
        .asMap()
        .map((key, value) => MapEntry(value.label, ""));
  }

  Widget widgetResolver(Label label) {
    StateProps props = StateProps(
      values: values,
      setState: setState,
    );

    switch (label.type) {
      case LabelType.text:
        return textWidget(label, props);
      case LabelType.password:
        return PasswordField(label: label, props: props);
      case LabelType.number:
        return numericField(label, props);
      default:
        return const Text("Unknown label type");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(children: [
          ...widget.props.labels.map((label) {
            return widgetResolver(label);
          }).toList(),
          FloatingActionButton(
            onPressed: () => widget.props.onSubmit(),
            child: const Text('Submit'),
          ),
        ]));
  }
}

class StateProps {
  late Map<String, String> values;
  late Function setState;

  StateProps({required this.values, required this.setState});
}

Widget textWidget(Label label, StateProps props) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label.label,
    ),
    onChanged: (value) => {
      props.setState(() {
        props.values[label.label] = value;
      })
    },
  );
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.label, required this.props});

  final Label label;
  final StateProps props;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label.label,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            widget.props.setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      obscureText: _obscureText,
      onChanged: (value) => {
        widget.props.setState(() {
          widget.props.values[widget.label.label] = value;
        })
      },
    );
  }
}

Widget numericField(Label label, StateProps props) {

  return TextFormField(
    decoration: InputDecoration(
      labelText: label.label,
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    onChanged: (value) => 
          props.setState(() {
            props.values[label.label] = value;
          })
        
    
  );
}
