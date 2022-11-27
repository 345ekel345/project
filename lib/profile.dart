import 'package:flutter/material.dart';

class LayoutSample extends StatelessWidget {
  const LayoutSample({super.key});
  final hobbies = const ["guitar", "basketball", "dota 2", "exercise", "darts"];
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Simoun Ezequiel A. Tusi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'July 03 ,2000',
                  style: TextStyle(
                    color: Colors.grey[1200],
                  ),
                ),
                Text(
                  '352 Sitio Lote Lecheria Calamba City Laguna',
                  style: TextStyle(
                    color: Colors.grey[1000],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  child: const Text(
                    'Tusi is to believe. Kulang sa Romansa. Wag nang patagalin, gawan agad ng aksyon.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget hobbiesSection = Row(
      children: [
        for (String hobby in hobbies)
          Text(
            hobby,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
      ],
    );
    Widget myName = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        "Simoun Ezequiel A. Tusi",
        softWrap: true,
      ),
    );
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: "Tusi Time",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tusi Time"),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/hand.jpg',
              width: 600,
              height: 400,
              fit: BoxFit.cover,
            ),
            titleSection,
            hobbiesSection,
          ],
        ),
      ),
    );
  }
}
