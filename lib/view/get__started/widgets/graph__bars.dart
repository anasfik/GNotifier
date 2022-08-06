import 'package:flutter/material.dart';

class GraphBars extends StatelessWidget {
  GraphBars(
      {Key? key,
      required this.colors,
      required this.values,
      required this.barsBoundedBy})
      : super(key: key);
  List<double?> values;
  List colors;
  double barsBoundedBy;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...List.generate(
          values.length,
          (index) => Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(barsBoundedBy),
              color: colors[index % 2],
            ),
            width: 25,
            height: values[index],
          ),
        ),
      ],
    );
  }
}
