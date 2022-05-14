import 'package:flutter/material.dart';
import 'package:flutter_asynchronous_api/shared/constants.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('Something went wrong', style: Constants.errorStyle)
      ],
    );
  }
}
