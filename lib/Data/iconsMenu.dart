import 'package:flutter/material.dart';

class IconMenu {
  final String text;
  final IconData icon;

  const IconMenu({
    required this.text,
    required this.icon,
  });
}

class IconsMenu {
  static const items = <IconMenu>[
    edit,
    delete,
  ];

  static const edit = IconMenu(
    text: "Edit Book title",
    icon: Icons.edit,
  );

  static const delete = IconMenu(
    text: "Delete Book",
    icon: Icons.delete,
  );
}
