import 'package:flutter/material.dart';
import 'addPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'To Do List'),
    );
  }
}

class Note {
  final String title;
  final Color color;

  Note({required this.title, required this.color});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Note> notes = [];

  void navigateToAddPage(BuildContext context) async {
    final Note? newNote = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const AddPage()));

    if (newNote != null) {
      setState(() {
        notes.add(newNote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: TextButton(
          onPressed: () {},
          child: const Text("Label", style: TextStyle(fontSize: 12)),
        ),
        title: const Text("Title"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                fillColor: Colors.grey[100],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Notes",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: notes[index].color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      notes[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        shape: const CircleBorder(),
        onPressed: () => navigateToAddPage(context),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
