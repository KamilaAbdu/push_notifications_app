import 'package:flutter/material.dart';

class TokenDisplay extends StatelessWidget {
  final String? token;

  const TokenDisplay({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: token == null
          ? const CircularProgressIndicator()
          : SelectableText(
              token!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
    );
  }
}
