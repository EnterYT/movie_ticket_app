import 'package:flutter/material.dart';

class StuffListScreen extends StatelessWidget {
  const StuffListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of "The Queen\'s Gambit" Characters'),
      ),
      body: ListView(
        children: [
          buildCharacterItem(context, 'assets/img/beth.jpg', 'Beth Harmon', 'Chess Prodigy'),
          buildCharacterItem(context, 'assets/img/benny.jpg', 'Benny Watts', 'Chess Grandmaster'),
          buildCharacterItem(context, 'assets/img/jolene.jpg', 'Jolene', 'Supportive Friend'),
          // Add more character items as needed
        ],
      ),
    );
  }

  Widget buildCharacterItem(BuildContext context, String imagePath, String name, String role) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      subtitle: Text('Role: $role'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StuffDetailScreen(name, role),
          ),
        );
      },
    );
  }
}

class StuffDetailScreen extends StatelessWidget {
  final String characterName;
  final String characterRole;

  const StuffDetailScreen(this.characterName, this.characterRole, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              characterName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Role: $characterRole',
              style: const TextStyle(fontSize: 18),
            ),
            // Add more details about the character if needed
          ],
        ),
      ),
    );
  }
}
