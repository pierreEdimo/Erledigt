import 'package:erledigt/Widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _emailUri = Uri(
  scheme: 'mailto',
  path: 'pierredimo@live.com',
);

_sendEmail() async {
  await launch(_emailUri.toString());
}

Widget contactTile(BuildContext context) {
  return InkWell(
    onTap: () => _sendEmail(),
    child: customListTile(
      Icon(Icons.contact_mail_outlined),
      'Contact',
    ),
  );
}
