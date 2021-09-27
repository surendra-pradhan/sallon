import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sallon/providers/userdata.dart';
import 'package:sallon/screens/profilesetting_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routName = '/profile';

  @override
  Widget build(BuildContext context) {
    Widget _profileList(IconData leadIcon, String title, IconData trailIcon) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Card(
          child: ListTile(
            leading: Icon(leadIcon),
            title: Text(title),
            trailing: Icon(trailIcon),
          ),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Consumer<Userdata>(
                builder: (ctx, userdt, _) => Column(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: userdt.userdata.image == null
                            ? Image.network(
                                "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?size=626&ext=jpg",
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                userdt.userdata.image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userdt.userdata.name == null
                          ? 'Surendra pradhan'
                          : userdt.userdata.name.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Spa & Skin Treatment",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child:
                  _profileList(Icons.settings, "Settings", Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(ProfileSetting.routerName);
              },
            ),
            _profileList(Icons.content_cut, "My Services", Icons.chevron_right),
            _profileList(
                Icons.account_balance_wallet, "Cupons", Icons.chevron_right),
            _profileList(
                Icons.support_agent, "Support Request", Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
