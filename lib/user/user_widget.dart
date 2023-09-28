import 'package:flutter/material.dart';
import 'package:shared_pref_play/util/prefs.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({Key? key}) : super(key: key);
  @override
  UserState createState() => UserState();
}

class UserState extends State<UserWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[
        const Text(
          'User information',
        ),
        Text(
          Prefs.user.name ?? '',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          Prefs.user.email ?? '',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ]),
    );
  }
}
