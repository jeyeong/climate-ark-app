class AccountData {
  int accountID;

  String firstName;
  String lastName;

  int streak;
  List<List<Object>> actionsCompleted;
  List<List<Object>> actionsCompletedToday;

  AccountData(
    this.accountID,
    this.firstName,
    this.lastName,
    this.streak,
    this.actionsCompleted,
    this.actionsCompletedToday,
  );
}

class CarbonAction {
  final int id;
  final String actionName;
  final String actionDescription;
  final String category;
  final double carbonScore;
  final int amountSavedAnnually;

  CarbonAction(
    this.id,
    this.actionName,
    this.actionDescription,
    this.category,
    this.carbonScore,
    this.amountSavedAnnually,
  );
}

AccountData fakeAccountData = AccountData(
  123,
  'James',
  'Soh',
  5,
  [
    [DateTime.utc(2022, 11, 21), 2],
    [DateTime.utc(2022, 11, 21), 3],
    [DateTime.utc(2022, 11, 22), 2],
    [DateTime.utc(2022, 11, 23), 7],
    [DateTime.utc(2022, 11, 25), 1],
    [DateTime.utc(2022, 11, 27), 3],
    [DateTime.utc(2022, 11, 27), 5],
    [DateTime.now(), 2],
    [DateTime.now(), 3],
  ],
  [
    [DateTime.now(), 2],
    [DateTime.now(), 3],
  ],
);

List<CarbonAction> fakeActions = [
  CarbonAction(
    0,
    "Carpooling",
    "Instead of driving solo, car pool and save both money and planet",
    "Commute",
    900,
    1,
  ),
  CarbonAction(
    1,
    "Cold Washing",
    "Washing your clothes and linens in cold water can reduce laundry energy by 90%, and most detergents are now made to work just as well in cold water",
    "Water",
    64,
    1,
  ),
  CarbonAction(
    2,
    "Driving Speed",
    "Keeping your highway driving speed below 65 MPH, avoiding rapid acceleration, taking your foot off the accelerator before braking can save a lot of fuel",
    "Commute",
    32,
    1,
  ),
  CarbonAction(
    3,
    "Drying",
    "Line dry clothing: Hanging laundry up to dry saves energy and money, so investing in a drying rack or clothesline pays off quickly",
    "Household",
    400,
    1,
  ),
  CarbonAction(
    4,
    "Dual flush Tanks",
    "Change flush tanks to dual flush tanks of 6 litres and 4 litres to save water",
    "Water",
    99,
    1,
  ),
  CarbonAction(
    5,
    "Eat less meat 1 day in the week",
    "Reduce the meat consumption by not eating meat for 1 day",
    "Food",
    1,
    1,
  ),
  CarbonAction(
    6,
    "Eat less meat 2 days in the week",
    "Reduce the meat consumption by not eating meat for 2 days",
    "Food",
    1,
    1,
  ),
  CarbonAction(
    7,
    "Eat together",
    "Use microwave less by heating all things once, reduce use of microwave for 5 mins a day",
    "Electronics",
    30,
    1,
  ),
  CarbonAction(
    8,
    "Food Wastage",
    "Do not waste food, instead compost or consume, reduce food wastage by 1 kg /day",
    "Food",
    470,
    1,
  ),
  CarbonAction(
    9,
    "Harvest rainwater",
    "Harvest 1000 litres of rainwater per household per day for 40 days",
    "Water",
    60,
    1,
  ),
  CarbonAction(
    10,
    "Laptop Settings",
    "Ensuring that your computers and monitors are turned off or in sleep mode when you're not using them can save a lot of energy and cash",
    "Electronics",
    200,
    1,
  ),
  CarbonAction(
    11,
    "Long Travel",
    "Take trains instead of short haul flights,(Case in point - Air France)",
    "Commute",
    122,
    1,
  ),
  CarbonAction(
    12,
    "Plastic water bottles",
    "Carry your own glass/metal bottle everywhere you go, Switch off laptops on weekends",
    "Plastic",
    2,
    1,
  ),
  CarbonAction(
    13,
    "Plugged appliances",
    "Switch off appliances at the plug instead of just switching from remote",
    "Electronics",
    135,
    1,
  ),
  CarbonAction(
    14,
    "Rechargable batteries",
    "Rechargeable batteries save resources, energy, money and waste",
    "Electronics",
    200,
    1,
  ),
  CarbonAction(
    15,
    "Recycle Paper",
    "Send paper for recycling instead of disposing it in garbage",
    "Paper",
    1.8,
    1,
  ),
  CarbonAction(
    16,
    "Reusable Carry Bags",
    "Carry your own reusable carry bags or take a cloth bag along when visiting a Supermarket or Grocery Store",
    "Plastic",
    12,
    1,
  ),
  CarbonAction(
    17,
    "Shop less",
    "Shop only when required and not otherwise. Select this activity when you had urged to shop and you didnt",
    "Consumables",
    1,
    1,
  ),
  CarbonAction(
    18,
    "Short Air Travel",
    "Take bus instead of short haul flights once a month",
    "Commute",
    94,
    1,
  ),
  CarbonAction(
    19,
    "Shutdown Laptops",
    "Switch off laptops on weekends",
    "Electronics",
    200,
    1,
  ),
  CarbonAction(
    20,
    "Solar Inverters",
    "Switch to solar inverters for electricity requirements during power cuts",
    "Electronics",
    984,
    1,
  ),
  CarbonAction(
    21,
    "Solar Panels",
    "Install solar panels and power your home using solar energy",
    "Electronics",
    617,
    1,
  ),
  CarbonAction(
    22,
    "Switch Lights",
    "Replace normal lights or bulbs with LED Lights",
    "Electronics",
    300,
    1,
  ),
  CarbonAction(
    23,
    "Take the stairs",
    "Reduce 50 lifts moves between ground and third floor at your workplace",
    "Electronics",
    1200,
    1,
  ),
  CarbonAction(
    24,
    "Tires",
    "Maintaining proper tire pressure and changing your vehicle's air filter regularly improves fuel efficiency",
    "Commute",
    140,
    1,
  ),
  CarbonAction(
    25,
    "Traffic Lights",
    "Switch off ignition at traffic lights",
    "Commute",
    122,
    1,
  ),
  CarbonAction(
    26,
    "Turn off Lights",
    "turn off lights and fans when not in use",
    "Electronics",
    200,
    1,
  ),
  CarbonAction(
    27,
    "Unused sheets ",
    "Collect unsed sheets of paper from old notebooks to make new ones",
    "Paper",
    5,
    1,
  ),
  CarbonAction(
    28,
    "Walking ",
    "Walk instead of driving for short distance one a week",
    "Commute",
    47,
    1,
  ),
  CarbonAction(
    29,
    "Water efficiency equipments",
    "Install Water efficiency showers and faucets and use water judiciously",
    "Water",
    189,
    1,
  ),
  CarbonAction(
    30,
    "Solar heaters",
    "Install solar water heaters instead of normal geysers",
    "Electronics",
    687,
    1,
  ),
  CarbonAction(
    31,
    "5 star rated ACs",
    "Buying only electronics with an Energy Star label means your gizmos will be efficient when they're running",
    "Electronics",
    197,
    1,
  ),
  CarbonAction(
    32,
    "Energy Efficieny (Fans)",
    "Buying only electronics with an Energy Star label means your gizmos will be efficient when they're running",
    "Electronics",
    46,
    1,
  ),
  CarbonAction(
    33,
    "5 star rated refrigrators",
    "Buying only electronics with an Energy Star label means your gizmos will be efficient when they're running",
    "Electronics",
    101,
    1,
  ),
];
