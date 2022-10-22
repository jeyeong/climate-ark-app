import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(10),
        height: 140.0,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 70,
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: 70,
                color: Colors.green,
              ),
            ),
          ],
        ));

    // Container(
    //   height: 140.0,
    //   width: double.infinity,
    //   padding: const EdgeInsets.symmetric(horizontal: 14.0),
    //   child: Container(
    //     width: double.infinity,
    //     decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(15)),
    //       color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           color: Color(0xffe6e6e6),
    //           spreadRadius: 0.25,
    //           blurRadius: 0.5,
    //           offset: Offset(0, 1),
    //         )
    //       ],
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: Container(
    //                   color: Colors.green,
    //                   height: 70,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               Expanded(
    //                 flex: 8,
    //                 child: Container(
    //                   color: Colors.amber,
    //                   height: 40,
    //                 ),
    //               ),
    //               Expanded(
    //                 flex: 1,
    //                 child: Container(),
    //               ),
    //               Expanded(
    //                 flex: 15,
    //                 child: Container(
    //                   color: Colors.blue,
    //                   height: 40,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
