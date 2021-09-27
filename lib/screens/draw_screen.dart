import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sallon/providers/auth.dart';
import 'package:sallon/providers/userdata.dart';
import 'package:sallon/screens/paymentScreen.dart';

class DrawScreen extends StatelessWidget {
  Widget _menuitem(IconData icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon)),
        SizedBox(width: 30),
        Text(title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Consumer<Userdata>(
              builder: (ctx, userdata, _) => Column(
                children: [
                  ClipOval(
                    child: userdata.userdata.image == null
                        ? Image.network(
                            "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?size=626&ext=jpg",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            userdata.userdata.image,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    userdata.userdata.name == null
                        ? "surendra pradhan"
                        : userdata.userdata.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    userdata.userdata.phone == null
                        ? "985-3365-924"
                        : userdata.userdata.phone.toString(),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child:
                _menuitem(Icons.account_balance_wallet, 'Add Payment Method'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(PaymentScreen.routerName);
            },
          ),
          Divider(
            thickness: 1,
          ),
          _menuitem(Icons.lock, 'Change Password'),
          Divider(
            thickness: 1,
          ),
          _menuitem(Icons.settings, 'Help & Support'),
          Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: _menuitem(Icons.logout, 'Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
