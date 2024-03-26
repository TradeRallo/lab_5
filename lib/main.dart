import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список элементов',
      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Список элементов'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Обработка нажатия на кнопку "Простой список"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SimpleListPage()),
                );
              },
              child: Text('Простой список'),
            ),
            ElevatedButton(
              onPressed: () {
                // Обработка нажатия на кнопку "Бесконечный список со строками"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfiniteStringListPage()),
                );
              },
              child: Text('Бесконечный список со строками'),
            ),
            ElevatedButton(
              onPressed: () {
                // Обработка нажатия на кнопку "Бесконечный список с возведением числа 2 в степень"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfinitePowerListPage()),
                );
              },
              child: Text('Бесконечный список с возведением числа 2 в степень'),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Простой список'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Элемент $index'),
          );
        },
      ),
    );
  }
}

class InfiniteStringListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бесконечный список со строками'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Элемент $index'),
          );
        },
      ),
    );
  }
}

class InfinitePowerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бесконечный список с возведением числа 2 в степень'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('2 в степени $index равно ${2.pow(index)}'),
          );
        },
      ),
    );
  }
}

extension IntExtensions on int {
  int pow(int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= this;
    }
    return result;
  }
}
