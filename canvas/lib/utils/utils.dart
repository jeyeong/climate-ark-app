import 'package:canvas/data.dart';

List<CarbonAction> getCompletedActions(
    List<CarbonAction?> actions, List<int> completedActionIdList) {
  List<CarbonAction> completedActions = [];

  for (int id in completedActionIdList) {
    CarbonAction? action = actions.firstWhere(
      (element) => element?.id == id,
      orElse: () => null as CarbonAction,
    );

    if (action != null) {
      completedActions.add(action);
    }
  }

  return completedActions;
}

double calculateCarbonSaved(List<CarbonAction> completedActions) {
  double carbonSaved = 0;

  for (CarbonAction action in completedActions) {
    carbonSaved += action.carbonScore;
  }

  return carbonSaved;
}
