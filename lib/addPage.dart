import 'package:flutter/material.dart';

import 'main.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
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
      appBar: AppBar(title: const Text("New Note"), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: "Write a title...",
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  hintText: "Write a note...",
                  border: InputBorder.none,
                ),
              ),
            ),

            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Choose Note Color:",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors.map((color) {
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedColor == color
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        if (selectedColor == color)
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  Navigator.of(context).pop(
                    Note(
                      title: titleController.text,
                      content: contentController.text.isEmpty
                          ? null
                          : contentController.text,
                      color: selectedColor,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Add a title to the note.")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: selectedColor,
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 2,
              ),
              child: const Text(
                "Save",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
