import 'package:canvas/data.dart';

List<Action> getCompletedActions(
    List<Action?> actions, List<int> completedActionIdList) {
  List<Action> completedActions = [];

  for (int id in completedActionIdList) {
    Action? action = actions.firstWhere(
      (element) => element?.id == id,
      orElse: () => null as Action,
    );

    if (action != null) {
      completedActions.add(action);
    }
  }

  return completedActions;
}

int calculateCarbonSaved(List<Action> completedActions) {
  int carbonSaved = 0;

  for (Action action in completedActions) {
    carbonSaved += action.carbonScore;
  }

  return carbonSaved;
}
