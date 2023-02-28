import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'exercise.dart';
import '../components/exercise_form.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  late Box<Exercise> _exercisesBox;

  @override
  void initState() {
    super.initState();
    _exercisesBox = Hive.box<Exercise>('exercises');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Workout Tracker'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _exercisesBox.listenable(),
        builder: (context, Box<Exercise> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final exercise = box.getAt(index)!;
              return ListTile(
                title: Text(exercise.name),
                subtitle:
                    Text('Sets: ${exercise.sets}, Reps: ${exercise.reps}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text("Delete Exercise"),
                        content: Text(
                            "Are you sure you want to delete this exercise?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              _exercisesBox.deleteAt(index);
                              Navigator.of(context).pop();
                            },
                            child: Text("Delete"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newExercise = await showDialog<Exercise>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('New Exercise'),
                content: ExerciseForm(
                  onSaved: (exercise) {
                    Navigator.of(context).pop(exercise);
                  },
                ),
              );
            },
          );

          if (newExercise != null) {
            _exercisesBox.add(newExercise);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
