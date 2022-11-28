import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserDataCustomWidget extends StatelessWidget {
  const UserDataCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileImage = IConfigService().getUserInfo()?.profileImage;

    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
              radius: 70,
              backgroundImage: profileImage != null ? MemoryImage(profileImage) : null,
              child: profileImage != null
                  ? null
                  : Icon(
                      FontAwesomeIcons.userTie,
                      color: Theme.of(context).primaryColor,
                      size: 60,
                    )),
          const SizedBox(
            height: 15,
          ),
          Text(
            'User: ${IConfigService().getUserInfo()!.displayName!}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).textTheme.bodyText1!.color),
          ),
          const Divider(
            height: 20,
            color: Colors.white,
          ),
          Text('Roles: ',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: 20,
              )),
          const SizedBox(height: 20),
          Text([].join(', '), //TODO fix roles
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: 16,
              )),
          const Divider(height: 20, color: Colors.white),
        ],
      ),
    );
  }
}
