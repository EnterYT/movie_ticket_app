// NewsPage.dart

import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: Builder(
        builder: (context) {
          ThemeData theme = Theme.of(context);
          return Container(
            color: theme.scaffoldBackgroundColor,
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ListTile(
                  title: Text('The Queen\'s Gambit Season 2 Announced!'),
                  subtitle: Text('Netflix has officially announced the renewal of The Queen\'s Gambit for a second season. Fans are excited to see what\'s next for Beth Harmon.'),
                ),
                const ListTile(
                  title: Text('The Queen\'s Gambit Wins Emmy Awards'),
                  subtitle: Text('The Queen\'s Gambit has won multiple Emmy Awards, including Outstanding Limited or Anthology Series. The show received critical acclaim for its storytelling and performances.'),
                ),
                const ListTile(
                  title: Text('Interview with Anya Taylor-Joy'),
                  subtitle: Text('Anya Taylor-Joy, who plays Beth Harmon in The Queen\'s Gambit, discusses her experience filming the series and her preparation for the role in a recent interview.'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
