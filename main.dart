import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allListItems = [
    {
      "id": 1,
      "name": "shega",
      "age": 21,
    },
    {
      "id": 2,
      "name": "Rahoof",
      "age": 45,
    },
    {
      "id": 3,
      "name": "Thahira",
      "age": 35,
    },
    {
      "id": 4,
      "name": " Shan",
      "age": 19,
    },
    {
      "id": 5,
      "name": " Sharhan",
      "age": 11,
    },
  ];
  List<Map<String, dynamic>> _foundItems = [];

  @override
  void initState() {
    _foundItems = _allListItems;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allListItems;
    } else {
      results = _allListItems
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEARCH LISTVIEW"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: "Search",
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundItems.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundItems[index]["id"]),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundItems[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundItems[index]["name"]),
                          subtitle: Text(
                              '${_foundItems[index]["age"].toString()} years old'),
                        ),
                      ),
                    )
                  : const Text(
                      "No result found",
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
