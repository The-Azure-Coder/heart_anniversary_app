import 'package:flutter/material.dart';

class GuestCards extends StatefulWidget {
  const GuestCards({super.key});

  @override
  State<GuestCards> createState() => _GuestCardsState();
}

class _GuestCardsState extends State<GuestCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15, top: 15),
        child: Stack(
          children: [
            const Card(
              child: ListTile(
                title: Text('Tyrese Morgan'),
                subtitle: Text('Stony hill, Amber institue of coding'),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 255, 59, 222),
              height: 77,
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
