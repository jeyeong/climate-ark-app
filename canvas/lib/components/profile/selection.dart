import 'package:flutter/material.dart';
import 'package:canvas/constants.dart';

class Section extends StatelessWidget {
  final String title;
  final String subtitle;
  Widget icon;

  Section({
    Key? key,
    required this.title,
    required this.icon,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Center(
          child: Column(children: [
            ListTile(
                tileColor: primaryColor,
                leading: SizedBox(
                  height: double.infinity,
                  child: Transform.scale(scale: 1.5, child: icon),
                ),
                minLeadingWidth: 40.0,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15)),
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(subtitle,
                    style: const TextStyle(
                      fontSize: 9,
                    )),
                trailing: MaterialButton(
                  onPressed: () {},
                  color: primaryLightestColor,
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: primaryColor,
                  ),
                  padding: const EdgeInsets.all(1),
                  shape: const CircleBorder(),
                )),
            const Divider(
              height: 1,
              thickness: 1,
              color: darkGrey,
              indent: 20,
              endIndent: 20,
            ),
          ]),
        ));
  }
}
