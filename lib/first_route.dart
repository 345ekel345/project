import 'package:flutter/material.dart';
import 'second_route.dart';
import 'screen_arguement.dart';
import 'extract_arguements.dart';
import 'pass_arguements.dart';
import 'profile.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Profile Page'),
              onTap: () {
                // Update the state of the app.
                // ...copy paste here the navigator.push method here
                //you may navigate to SecondScreen
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: const Text('GWA Calculator'),
              onTap: () {
                // Update the state of the app.
                // ...copy paste here the navigator.push method here
                //you may navigate to SecondScreen
                Navigator.pop(context);
                Navigator.pushNamed(context, '/gwacal');
              },
            ),
            ListTile(
              title: const Text('Passed Argument'),
              onTap: () {
                // Update the state of the app.
                // ...copy paste here the navigator.push method
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to Profile'),
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and
                // provide the arguments as an optional
                // parameter.
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Go to Pass Arguements'),
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and
                // provide the arguments as an optional
                // parameter.
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Go to Profile route'),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ElevatedButton(
              child: const Text('Go to GWA route'),
              onPressed: () {
                Navigator.pushNamed(context, '/gwacal');
              },
            ),
          ],
        ),
      ),
    );
  }
}
