import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String field;
  final String value;
  const ListItemWidget({
    Key? key,
    required this.field,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$field : ',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
