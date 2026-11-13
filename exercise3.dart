import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ShoppingListPage(),
  ));
}

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final itemController = TextEditingController();
  final List<String> shoppingList = [];

  void addItem() {
    String item = itemController.text.trim();

    if (item.isEmpty) {
      return;
    }

    setState(() {
      shoppingList.add(item);
    });

    itemController.clear();
  }

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('لیست خرید')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: itemController,
                decoration: const InputDecoration(labelText: 'نام کالا'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: addItem,
                child: const Text('اضافه کردن'),
              ),
              const SizedBox(height: 24),
              for (String item in shoppingList)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(item, style: const TextStyle(fontSize: 18)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
