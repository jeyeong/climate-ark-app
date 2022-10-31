class AccountData {
  String firstName;
  String lastName;

  int streak;
  List<int> actionsCompleted;

  AccountData(
    this.firstName,
    this.lastName,
    this.streak,
    this.actionsCompleted,
  );
}

class Action {
  final int id;
  final String actionName;
  final String actionDescription;
  final int carbonScore;
  final int amountSavedAnnually;
  bool completed = false;

  Action(
    this.id,
    this.actionName,
    this.actionDescription,
    this.carbonScore,
    this.amountSavedAnnually,
  );
}

AccountData fakeAccountData = AccountData(
  'John',
  'Wick',
  5,
  [0, 8, 9],
);

List<Action> fakeActions = [
  Action(
    0,
    'Turn Off Lights',
    'When not in use, switch off the lights.',
    5,
    10,
  ),
  Action(
    1,
    'Use A Reusable Bottle',
    'Reduce plastic waste and the carbon that comes with it.',
    5,
    20,
  ),
  Action(
    2,
    'Walk/Bike to Work',
    "Driving releases a lot of carbon!",
    80,
    150,
  ),
  Action(
    3,
    'Do Laundry in Full Loads',
    "Reduce the frequency of laundry.",
    15,
    30,
  ),
  Action(
    4,
    'Set Thermostat to 78 in Summer',
    "Less cooling reduces carbon!",
    40,
    100,
  ),
  Action(
    5,
    'Set Thermostat to 67 in Winter',
    "Less heating reduces carbon!",
    40,
    100,
  ),
  Action(
    6,
    'Unplug Devices When Not in Use',
    "Plugged-in devices use energy unnecessarily.",
    5,
    10,
  ),
  Action(
    7,
    'Go Thrift Shopping',
    "Buy used clothes instead of new ones.",
    10,
    50,
  ),
  Action(
    8,
    'LED Light Bulbs',
    "Switch out your non-LED light bulbs for LED ones.",
    15,
    40,
  ),
  Action(
    9,
    'Change Laptop Settings',
    "Ensuring that your computers and monitors are turned off.",
    10,
    15,
  ),
];
