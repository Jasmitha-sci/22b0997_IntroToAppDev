import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FirstRoute()));

class Category {
  String name;
  int value;
  Category({required this.name, required this.value});
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  List<String> expenses = ['TOTAL', 'Salary', 'Food', 'clothes'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 206, 189, 247),
        appBar: AppBar(
          title: const Text('Budget Tracker'),
          backgroundColor: const Color.fromARGB(255, 244, 157, 44),
        ),
        body: Center(
          child: Column(children: [
            const Icon(
              Icons.person_3_sharp,
              color: Colors.deepPurple,
              size: 175,
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Text(
              "Back!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 131, 42),
                border: Border.all(
                  color: const Color.fromARGB(255, 46, 164, 203),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Total Expenses",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Text('48000'),
                  Transform.scale(
                    scale: 2,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondRoute()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            _showPopupCard(context);
          },
          child: const Icon(Icons.add),
        ));
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  List<Category> expenses = [
    Category(name: 'Salary', value: 50000),
    Category(name: 'Bills', value: -1000),
    Category(name: 'Groceries', value: -300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 119, 226),
      appBar: AppBar(
        title: const Text('Expenses'),
        shadowColor: const Color.fromARGB(255, 239, 140, 54),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 175, 230, 46),
              border: Border.all(
                color: const Color.fromARGB(255, 203, 46, 111),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Total Expenses",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Text('48700'),
                Transform.scale(
                  scale: 2,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(
                          context // Calculate the total value of all categories
                          );
                    },
                    icon: const Icon(
                      Icons.arrow_drop_up_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: expenses
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 196, 30),
                      border: Border.all(
                        color: const Color.fromARGB(255, 203, 46, 111),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          e.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('${e.value}'),
                        IconButton.filled(
                          onPressed: () {
                            delete(expenses, e);
                          },
                          icon: const Icon(Icons.delete_rounded),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          _showPopupCard(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _showPopupCard(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Set your custom border radius here
        ),
        backgroundColor: const Color.fromARGB(255, 84, 213, 245),
        title: const Text('NEW ENTRY'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Category'),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(labelText: 'Value'),
              ),
            ],
          ),
        ),
        actions: [
          Transform.scale(
            scale: 2,
            child: IconButton(
              onPressed: () {
                // Perform actions on the data, like saving to a database
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check_circle),
            ),
          ),
          Transform.scale(
            scale: 2,
            child: IconButton(
              onPressed: () {
                // Perform actions on the data, like saving to a database
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close_rounded),
            ),
          ),
        ],
      );
    },
  );
}

List<Category> delete(List<Category> P, Category o) {
  P.remove(o);
  return P;
}
