import 'package:flutter/material.dart';
import 'package:postgresUn/core/constants.dart';

class HeaderPage extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  const HeaderPage({
    Key? key,
    required this.title,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.bodyPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          ...actions,
        ],
      ),
    );
  }
}
