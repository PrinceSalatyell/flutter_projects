import 'package:flutter/material.dart';
import 'package:quotes/quotes.dart';

class QuoteCard extends StatelessWidget {

  final Quote? quote;
  final Function() delete;

  const QuoteCard({this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote!.text.toString(),
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              quote!.author.toString(),
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800]
              ),
            ),
            const SizedBox(height: 5.0),
            TextButton.icon(
              label: const Text('delete quote'),
              icon: const Icon(Icons.delete),
              onPressed: delete,
            )
          ],
        ),
      ),
    );
  }
}