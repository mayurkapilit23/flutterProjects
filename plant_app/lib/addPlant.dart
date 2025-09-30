import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPlant extends StatefulWidget {
  const AddPlant({super.key});

  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Add Plant",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text("Plant Type"),
                  DropDownTextField(
                    dropDownList: const [
                      DropDownValueModel(name: "Tree", value: "name1"),
                      DropDownValueModel(name: "Shrubs", value: "name2"),
                      DropDownValueModel(name: "Herbs", value: "name3"),
                      DropDownValueModel(name: "Climbers", value: "name4"),
                      DropDownValueModel(name: "Creepers", value: "name4"),
                    ],
                    // dropDownIconProperty: IconProperty(icon: Icon()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
