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

class CarbonAction {
  final int id;
  final String actionName;
  final String actionDescription;
  final int carbonScore;
  final int amountSavedAnnually;
  final String imageFile;
  bool completed = false;

  CarbonAction(
    this.id,
    this.actionName,
    this.actionDescription,
    this.carbonScore,
    this.imageFile,
    this.amountSavedAnnually,
  );
}

AccountData fakeAccountData = AccountData(
  'John',
  'Wick',
  5,
  [0, 8, 9],
);

List<CarbonAction> fakeActions = [
  CarbonAction(
    0,
    'Turn Off Lights',
    'When not in use, switch off the lights.',
    5,
    'assets/images/light_switch.jpg',
    10,
  ),
  CarbonAction(
    1,
    'Use A Reusable Bottle',
    'Reduce plastic waste and the carbon that comes with it.',
    5,
    'assets/images/reusable_water_bottle.jpg',
    20,
  ),
  CarbonAction(
    2,
    'Walk/Bike to Work',
    "Driving releases a lot of carbon!",
    80,
    'assets/images/bike_to_work.jpg',
    150,
  ),
  CarbonAction(
    3,
    'Do Laundry in Full Loads',
    "Reduce the frequency of laundry.",
    15,
    'assets/images/doing_laundry.jpg',
    30,
  ),
  CarbonAction(
    4,
    'Set Thermostat to 78 in Summer',
    "Less cooling reduces carbon!",
    40,
    'assets/images/save_temp.jpg',
    100,
  ),
  CarbonAction(
    5,
    'Set Thermostat to 67 in Winter',
    "Less heating reduces carbon!",
    40,
    'assets/images/save_temp.jpg',
    100,
  ),
  CarbonAction(
    6,
    'Unplug Devices When Not in Use',
    "Plugged-in devices use energy unnecessarily.",
    5,
    'assets/images/unplug.jpg',
    10,
  ),
  CarbonAction(
    7,
    'Go Thrift Shopping',
    "Buy used clothes instead of new ones.",
    10,
    'assets/images/thrift_shopping.jpg',
    50,
  ),
  CarbonAction(
    8,
    'LED Light Bulbs',
    "Switch out your non-LED light bulbs for LED ones.",
    15,
    'assets/images/led_lightbulbs.jpg',
    40,
  ),
  CarbonAction(
    9,
    'Change Laptop Settings',
    "Ensuring that your computers and monitors are turned off.",
    10,
    'assets/images/laptop.jpg',
    15,
  ),
];
