// This is the main entry point for the Flutter application.
import 'package:flutter/material.dart';

// The main function runs the app.
void main() {
  runApp(const MyApp());
}

// The root of the application, a StatefulWidget is used to manage navigation state.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // A variable to track the current screen index.
  int _currentIndex = 0;

  // A list of the widgets (screens) to be displayed.
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  // A function to update the current index and redraw the screen.
  void _onNavigate(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The theme for the entire app.
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // The home screen of the app.
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _currentIndex == 0 ? 'Home Screen' : 'Profile Screen',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          // Display the current screen from the list.
          child: _screens[_currentIndex],
        ),
        // The floating action button for navigation.
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Toggle between the two screens.
            _onNavigate(_currentIndex == 0 ? 1 : 0);
          },
          tooltip: 'Navigate',
          child: Icon(_currentIndex == 0 ? Icons.person : Icons.home),
        ),
      ),
    );
  }
}

// The Home Screen widget.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TASK: Replace this URL with a link to your profile picture.
          const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://placehold.co/200x200/png?text=Your+Photo'),
          ),
          const SizedBox(height: 20),
          
          const Text(
            'Sopiga Arumainayagam', // Replace with your name
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // TASK: Replace "Software Intern" with your specific role.
          const Text(
            'Software Intern', // Replace with your role
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// The Profile Screen widget.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Section for Educational Background.
          const Text(
            'Educational Background',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          // List of educational experiences.
          const Text(
            '• Bachelor of Science in Computer Science, University of Technology (2022-Present)',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          // Section for Skills.
          const Text(
            'Skills',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          // List of skills.
          const Text(
            '• Programming Languages: Dart, Python, JavaScript',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Text(
            '• Frameworks: Flutter, React, Node.js',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Text(
            '• Tools: Git, VS Code, Android Studio',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
