import 'package:flutter/material.dart';

class PopUP extends StatefulWidget {
  const PopUP({super.key});

  @override
  State<PopUP> createState() => _PopUPState();
}

class _PopUPState extends State<PopUP> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          trailing: PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                )
              ];
            },
            onSelected: (String value) {
              print('You Click on po up menu item');
            },
          ),
        )
      ],
    );
  }
}
