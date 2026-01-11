import 'package:flutter/material.dart';

import 'main.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final textController = TextEditingController();
  final List<Color> colors = [
    const Color(0xFFE1BEE7),
    const Color(0xFFE0F2F1),
    const Color(0xFFE1F5FE),
    const Color(0xFFFFF9C4), 
    const Color(0xFFFFEBEE),
    const Color(0xFFD7CCC8),
  ];

  Color selectedColor = const Color(0xFFE1BEE7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Note")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Note title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Choose color:"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors.map((color) {
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedColor == color
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  Navigator.of(
                    context,
                  ).pop(Note(title: textController.text, color: selectedColor));
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: selectedColor,
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
