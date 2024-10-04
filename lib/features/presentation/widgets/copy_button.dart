import 'package:flutter/material.dart';
import 'package:flutter/services.dart';  

class CopyButton extends StatelessWidget {
  final String? token;  

  const CopyButton({Key? key, required this.token}) : super(key: key);

  void _copyToClipboard(BuildContext context) {
    if (token != null) {
      Clipboard.setData(ClipboardData(text: token!));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Токен скопирован в буфер обмена!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: token == null ? null : () => _copyToClipboard(context),
      icon: const Icon(Icons.copy),
      label: const Text('Скопировать Токен'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}