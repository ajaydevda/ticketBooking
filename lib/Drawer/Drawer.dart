import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Widgets/Buttons/LogoutButton.dart';
import 'package:ticket_booking/Widgets/Menu/LeftMenuItemWidget.dart';

class LeftSideDrawer extends StatelessWidget {


  List<String> imageStr=[dashMenuIcon,bookNewTicketMenu,
    ViewMyTicketMenuIcon,WalletMenuIcon,TransactionHistoryMenuIcon,
    SettingsMenuIcon,SupportMenuIcon,LogOutButton];
    List<String> textStr=[
      "DashBoard","Book New Ticket","View My Ticket",
      "Wallet","Transaction History","Setting","Support","Logout"
    ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: imageStr.length,
        itemBuilder:(context, index) {
          if(index==7)
            {
              return LogoutButton(onPressed: (){},label: "Log Out",);
            }
          else {
           return LeftMenuItemWidget(
              text: textStr[index], image: imageStr[index], onPressed: () {},);
          }
          }
          );
        }

}
