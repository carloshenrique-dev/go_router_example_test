import 'package:flutter/material.dart';

class SimpleCardWidget extends StatelessWidget {
  final String value;
  final String type;
  final String date;

  const SimpleCardWidget({
    super.key,
    required this.value,
    required this.type,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    String returnCorrectMeasurement(type) {
      switch (type) {
        case 'HEART_RATE':
          return 'BPM';
        case 'ACTIVE_ENERGY_BURNED':
          return 'kCal';
        case 'STEPS':
          return 'steps';
        case 'WEIGHT':
          return 'kg';
        default:
          return '';
      }
    }

    return Container(
      width: 120,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(179, 158, 158, 158),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          /*Expanded(
            child: Text(
              type,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),*/
          Expanded(
            child: Text.rich(
              TextSpan(
                text: '$value ',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: returnCorrectMeasurement(type),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(179, 158, 158, 158),
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
