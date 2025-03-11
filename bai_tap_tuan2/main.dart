import 'package:flutter/material.dart';

void main() {
  runApp(const LibraryManagementApp());
}

class LibraryManagementApp extends StatelessWidget {
  const LibraryManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LibraryManagementScreen(),
    );
  }
}

class LibraryManagementScreen extends StatefulWidget {
  const LibraryManagementScreen({super.key});

  @override
  _LibraryManagementScreenState createState() => _LibraryManagementScreenState();
}

class _LibraryManagementScreenState extends State<LibraryManagementScreen> {
  List<bool> _selectedBooks = [true, true];
  final List<String> _books = ['Sách 01', 'Sách 02'];
  final TextEditingController _staffController = TextEditingController(text: 'Nguyen Van A');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Column(
          children: [
            Text("Hệ thống", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            Text("Quản lý Thư viện", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nhân viên", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _staffController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Đổi", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Danh sách sách", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: List.generate(_books.length, (index) {
                  return CheckboxListTile(
                    title: Text(_books[index]), // Hiển thị tên nhân viên
                    value: _selectedBooks[index],
                    onChanged: (value) {
                      setState(() {
                        _selectedBooks[index] = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: const Text("Thêm", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Quản lý"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "DS Sách"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nhân viên"),
        ],
      ),
    );
  }
}
