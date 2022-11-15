import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/impact_page/leaf_fill.dart';

class Streak extends StatelessWidget {
  final String streakDays;

  const Streak({Key? key, required this.streakDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.amber.shade700,
            Colors.amber.shade300,
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.local_fire_department,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            streakDays,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            "Days",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

class ActionsCompleted extends StatelessWidget {
  final String actionsCompleted;

  const ActionsCompleted({Key? key, required this.actionsCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.45,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        color: primaryLightestColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 35,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: Text(
                actionsCompleted,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Flexible is used for wrapping.
          const Flexible(
            child: Text(
              "Actions Completed",
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String carbonSaved;
  final String streakDays;
  final String actionsCompleted;

  const SummaryCard({
    Key? key,
    required this.carbonSaved,
    required this.streakDays,
    required this.actionsCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryWhite,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carbonSaved,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text("Kgs Carbon Saved")
              ],
            ),
            LeafBox(numSaved: 70, size: 100)
          ]),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Streak(
                streakDays: streakDays,
              ),
              ActionsCompleted(
                actionsCompleted: actionsCompleted,
              ),
            ],
          )
        ],
      ),
    );
  }
}
