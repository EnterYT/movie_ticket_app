// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ActorsListScreen extends StatelessWidget {
  const ActorsListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of "The Queen\'s Gambit" Actors'),
      ),
      body: ListView(
        children: [
          buildActorItem(
              context,
              'assets/img/taylor-joy.jpg',
              'Anya Taylor-Joy',
              'Beth Harmon',
              'Anya Taylor-Joy is an Argentine-British actress known for her role as Beth Harmon in "The Queen\'s Gambit" series. She was born on April 16, 1996, in Miami, Florida. Taylor-Joy trained as a ballet dancer before turning to acting.'),
          buildActorItem(
              context,
              'assets/img/brodie-sangster.jpg',
              'Thomas Brodie-Sangster',
              'Benny Watts',
              'Thomas Brodie-Sangster is an English actor known for his role as Benny Watts in "The Queen\'s Gambit" series. He was born on May 16, 1990, in London, England. Brodie-Sangster began acting at a young age and gained recognition for his role in "Love Actually."'),
          buildActorItem(
              context,
              'assets/img/campion.jpg',
              'Moses Ingram',
              'Jolene',
              'Moses Ingram is an American actress known for her role as Jolene in "The Queen\'s Gambit" series. She was born on August 19, 1994, in Charlotte, North Carolina. Ingram trained at the North Carolina School of the Arts before pursuing acting professionally.'),
          // Add more actors here...

        ],
      ),
    );
  }

  Widget buildActorItem(BuildContext context, String imagePath, String name,
      String role, String biography) {
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
            builder: (context) =>
                ActorDetailScreen(name, role, imagePath, biography),
          ),
        );
      },
    );
  }
}

class ActorDetailScreen extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;
  final String biography;

  const ActorDetailScreen(this.name, this.role, this.imagePath, this.biography, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actor Detail'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Role: $role',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Biography:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  biography,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
