// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class Comment {
  final String username;
  final String text;
  final int rating;

  Comment(this.username, this.text, this.rating);
}

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  int _rating = 0;
  // ignore: prefer_final_fields
  List<Comment> _comments = []; // Change to non-const
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment Section'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return ListTile(
                  title: Text('${comment.username}: ${comment.text}'),
                  subtitle: Text('Rating: ${comment.rating}/5'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _commentController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Comment',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Rating: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 1 ? Colors.orange : Colors.grey),
                      onPressed: () => _updateRating(1),
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 2 ? Colors.orange : Colors.grey),
                      onPressed: () => _updateRating(2),
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 3 ? Colors.orange : Colors.grey),
                      onPressed: () => _updateRating(3),
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 4 ? Colors.orange : Colors.grey),
                      onPressed: () => _updateRating(4),
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: _rating >= 5 ? Colors.orange : Colors.grey),
                      onPressed: () => _updateRating(5),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitComment,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _submitComment() {
    final String username = _usernameController.text.trim();
    final String commentText = _commentController.text.trim();

    if (username.isNotEmpty && commentText.isNotEmpty && _rating > 0) {
      final Comment newComment = Comment(username, commentText, _rating);
      setState(() {
        _comments.add(newComment);
      });

      _usernameController.clear();
      _commentController.clear();
      setState(() {
        _rating = 0;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Comment submitted successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields and provide a rating!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
