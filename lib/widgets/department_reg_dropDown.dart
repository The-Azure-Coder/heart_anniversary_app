import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DropDown();
  }
}

class _DropDown extends State<DropDown> {
  List<String> listItem = <String>["dep1", "dep2", "dep3", "dep4"];

  String dropDownValue = "dep1";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1.5,
                offset: const Offset(0, 2))
          ],
        ),
        width: 350,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButton<String>(
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
            },
            value: dropDownValue,
            items: listItem.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.grey.shade400),
                ),
              );
            }).toList()));
  }
}
