import 'package:flutter/material.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState() => _GuestListState();
}

class _GuestListState extends State<GuestList> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(190),
        child: AppBar(
          elevation: 0.0,
          title: const Text(
            'Guest Page',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Log Out',
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
          ],
          flexibleSpace: Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 140, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Hello User',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: SizedBox(
                        width: 170,
                        child: Text('Welcome to Heart 40th Aniversary ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(left: 295.0, top: 110),
                  width: 90,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/ribbon.png',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Guest Lists ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 153, 153, 153),
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: const Color.fromARGB(255, 231, 229, 229))),
                child: const Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'search..',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(0.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 20, minWidth: 25),
                  ),
                )),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15, top: 15),
            child: Stack(
              children: [
                const Card(
                  child: ListTile(
                    title: Text('Moris Miller'),
                    subtitle: Text('Montego Bay, Food & Beverage'),
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
          Container(
            margin: const EdgeInsets.only(bottom: 15, top: 15),
            child: Stack(
              children: [
                const Card(
                  child: ListTile(
                    title: Text('Shseen Cameron'),
                    subtitle: Text('Clarendon, Amber institue of coding'),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 230, 252, 28),
                  height: 77,
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
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
                  color: const Color.fromARGB(255, 0, 160, 141),
                  height: 77,
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
