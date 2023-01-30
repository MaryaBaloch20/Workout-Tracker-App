import 'package:flutter/cupertino.dart';
import 'package:workout_tracker_app/models/exercise.dart';
import 'package:workout_tracker_app/models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList = [
    // default Workout
    Workout(
      name: 'Chest',
      exercises: [
        Exercise(
          name: 'Bench Press',
          sets: "3",
          reps: "10",
          weight: "135",
        ),
      ],
    ),
  ];

  // get the list of workouts
  List<Workout> getWorkouts() {
    return workoutList;
  }

  // get length of a given workout
  int numberOfExercisesInWorkout(String workoutName) {
    // find the workout
    Workout releventWorkout = getRelevantWorkout(workoutName);
    // return the length of the workout
    return releventWorkout.exercises.length;
  }

  // add a workout
  void addWorkout(String name) {
    // add a new workout with a blank list of exercises
    workoutList.add(Workout(name: name, exercises: []));

    // notify listeners
    notifyListeners();
  }

  // add an exercise to a workout
  void addExercise(String workoutName, String exerciseName, String sets,
      String reps, String weight) {
    // find the workout
    Workout releventWorkout = getRelevantWorkout(workoutName);
    // add the exercise to the workout
    releventWorkout.exercises.add(
      Exercise(
        name: exerciseName,
        sets: sets,
        reps: reps,
        weight: weight,
      ),
    );

    // notify listeners
    notifyListeners();
  }

  // check off an exercise once completed
  void checkExercise(String workoutName, String exerciseName) {
    // find the workout
    Workout releventWorkout = getRelevantWorkout(workoutName);
    // find the exercise
    Exercise releventExercise = getRelevantExercise(workoutName, exerciseName);
    // check off the exercise
    releventExercise.isCompleted = !releventExercise.isCompleted;

    // notify listeners
    notifyListeners();
  }

  // return a relevant workout object, given a workout name
  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
  }

  // return a relevant exercise object, given a workout name and exercise name
  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    // find relevant workout first
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    // find relevant exercise
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);

    return relevantExercise;
  }
}
