import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/Model/SourceDestinationModel.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Widgets/Card/CardDecoration.dart';

class DropDownWidget extends StatefulWidget {
  List<FerryStops> ferryStopsData;

  Function onChange;

  DropDownWidget({required this.ferryStopsData, required this.onChange});

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late FerryStops fromSelectedItem;
  late FerryStops toSelectedItem;

  @override
  void initState() {
    // TODO: implement initState
    fromSelectedItem = widget.ferryStopsData[0];
    toSelectedItem = widget.ferryStopsData[1];
    widget.onChange(fromSelectedItem,toSelectedItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CardDecoration(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: DropdownSearch<FerryStops>(
                    dropdownSearchDecoration: InputDecoration(border: InputBorder.none,
                    ),
                    mode: Mode.MENU,
                    items: widget.ferryStopsData,
                    label: "From",
                    hint: "",
                    showAsSuffixIcons: false,
                    onChanged: (FerryStops? data) {
                      fromSelectedItem = data!;
                      setState(() {});
                      widget.onChange(fromSelectedItem,toSelectedItem);

                    },
                    selectedItem: fromSelectedItem,
                    popupItemDisabled: (FerryStops s) =>
                        s.name.contains(toSelectedItem.name),
                    itemAsString: (FerryStops? u) => u!.name, //selectedItem: ""
                  ),
                ),
                Divider(height: 1,),
                SizedBox(
                  height: 80,
                  child: DropdownSearch<FerryStops>(
                    dropdownSearchDecoration:
                        InputDecoration(border: InputBorder.none),

                    mode: Mode.MENU,
                    items: widget.ferryStopsData,
                    label: "To",
                    hint: "",
                    onChanged: (FerryStops? data) {
                      toSelectedItem = data!;
                      setState(() {});
                      widget.onChange(fromSelectedItem,toSelectedItem);

                    },
                    selectedItem: toSelectedItem,
                    popupItemDisabled: (FerryStops s) =>
                        s.name.contains(fromSelectedItem.name),
                    itemAsString: (FerryStops? u) => u!.name, //selectedItem: ""
                  ),
                ),
              ],
            ),
          ),
          
          Column(
            children: [
              InkWell(
                child: Container(
                    width: 40,height: 40,
                    child: Image.asset(SwitchIcon,
                    )
                ),
                onTap: ()
                {
                  setState(() {
                    FerryStops temp=fromSelectedItem;
                    fromSelectedItem=toSelectedItem;
                    toSelectedItem = temp;
                    widget.onChange(fromSelectedItem,toSelectedItem);

                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
