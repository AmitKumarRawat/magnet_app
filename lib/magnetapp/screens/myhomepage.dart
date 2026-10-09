import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> userdetails = [
    {
      'profileImage': 'url',
      "name": "Rashmika Singh",
      "designation": "Software Engineer at Troology Technologies",
      "city": "Ahmedabad",
      "totalviews": 1245,
      "totalBookmarks": 124,
    },
    {
      'profileImage': 'url',
      "name": "Rashmika Singh",
      "designation": "Software Engineer at Troology Technologies",
      "city": "Ahmedabad",
      "totalviews": 1245,
      "totalBookmarks": 124,
    },
    {
      'profileImage': 'url',
      "name": "Rashmika Singh",
      "designation": "Software Engineer at Troology Technologies",
      "city": "Ahmedabad",
      "totalviews": 1245,
      "totalBookmarks": 124,
    },
    {
      'profileImage': 'url',
      "name": "Rashmika Singh",
      "designation": "Software Engineer at Troology Technologies",
      "city": "Ahmedabad",
      "totalviews": 1245,
      "totalBookmarks": 124,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.2),
        title: Row(
          children: [
            Text(
              'magnet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black,
              ),
            ),
            Text(
              '.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),

        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.red),
          onPressed: () {
            //handle logo tap here
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
            ),
            child: IconButton(
              icon: Icon(Icons.chat, color: Colors.black, size: 18),
              onPressed: () {
                //handle chat tap here
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.black, size: 18),
              onPressed: () {
                //handle notification tap here
              },
            ),
          ),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              height: 400,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Positioned(
                    top: 41,
                    left: 41,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://example.com/profile.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: NetworkImage(); for url
                    ),
                  ),
                  Container(height: 100, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    'Rashmika Singh',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Software Engineer at Troology Technologies',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    'Ahmedabad',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  SizedBox(height: 10),
                  Container(height: 4, width: 42, color: Colors.grey),

                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Card(
                              elevation: 2,
                              child: Icon(
                                Icons.visibility,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
