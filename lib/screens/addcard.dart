import 'package:flutter/material.dart';
import '../widgets/dropdownwidget.dart';
import 'package:intl/intl.dart';

class AddCard extends StatefulWidget {
  static const routerName = '/addcard';
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  var card = "Master Card";
  var _timecontroller = TextEditingController();
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedTime) {
      if (pickedTime == null) {
        return;
      } else {
        _timecontroller.text = DateFormat.yM().format(pickedTime).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  AppDropdownInput(
                    hintText: "Crad Type",
                    options: ["Master Card", "Visa Card", "Credit Card"],
                    value: card,
                    onChanged: (String value) {
                      setState(() {
                        card = value;
                        // state.didChange(newValue);
                      });
                    },
                    getLabel: (String value) => value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Card Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Card Holder Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _showDatePicker,
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _timecontroller,
                              decoration: InputDecoration(
                                labelText: "Expiration Date",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "CVV",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: Text('Save Card'),
            ),
          ),
        ],
      ),
    );
  }
}
