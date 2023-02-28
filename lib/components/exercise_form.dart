import 'package:flutter/material.dart';
import '../pages/exercise.dart';

class ExerciseForm extends StatefulWidget {
  final Function(Exercise) onSaved;

  ExerciseForm({required this.onSaved});

  @override
  _ExerciseFormState createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _reps;
  late int _sets;

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final exercise = Exercise(_name, _reps, _sets);
      widget.onSaved(exercise);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Exercise name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter exercise name';
              }
              return null;
            },
            onSaved: (value) => _name = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Reps'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter reps';
              }
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) => _reps = int.parse(value!),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Sets'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter sets';
              }
              if (int.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) => _sets = int.parse(value!),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _save,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // background (button) color
              foregroundColor: Colors.white, // foreground (text) color
            ),
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
