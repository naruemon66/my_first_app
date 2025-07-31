import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import ไลบรารี Material ของ Flutter

void main() {
  // จุดเริ่มต้นของแอป Flutter
  runApp(const MyApp()); // บอก Flutter ว่าวิดเจ็ตใดคือรากฐานของแอป
}

// MyApp โดยทั่วไปคือวิดเจ็ตรากฐานของแอปพลิเคชันของคุณ
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // เมธอด build() ส่งคืนโครงสร้างต้นไม้วิดเจ็ตสำหรับวิดเจ็ตนี้
    return MaterialApp(
      title: 'My Awesome App',
      debugShowCheckedModeBanner: false, // ซ่อนแบนเนอร์ debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 250, 251, 217),
        ),
        useMaterial3: true, // ใช้ Material Design เวอร์ชันล่าสุด
      ),
      home: const MyHomePage(), // วิดเจ็ตหน้าจอหลักของคุณ
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ภายในเมธอด build ของ MyHomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter 4'),
        backgroundColor: const Color.fromARGB(255, 241, 170, 237),
      ),
      body: Padding(
        // เพิ่ม Padding รอบ Column
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // ใช้ Column สำหรับเลย์เอาต์แนวตั้ง
          // crossAxisAlignment:
          //    CrossAxisAlignment.center, // จัดกึ่งกลางไอเท็มแนวนอน
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // วิดเจ็ตต่างๆ จะมาที่นี่ภายในลิสต์ children ของ Column
            Image.network('https://picsum.photos/seed/flutter/400/200'),
            const SizedBox(height: 16.0),
            Image.asset(
              'assets/image/puppy dog.jpg',
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'ไม่สามารถโหลดรูปภาพได้',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Container(
              alignment: Alignment.center,
              width: 600.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 121, 188, 215),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "สวัสดี Flutter",
                style: GoogleFonts.lato(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(221, 8, 58, 128),
                ),
                //style: TextStyle(
                //  fontSize: 20.0,
                //   fontWeight: FontWeight.bold,
                //   color: Color.fromARGB(255, 11, 7, 255),
                // ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดกึ่งกลางปุ่มแนวนอน
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    print('กดปุ่ม Elevated');
                  },
                  child: const Text('Elevated'),
                ),
                const SizedBox(width: 10.0), // เว้นวรรคระหว่างปุ่ม
                OutlinedButton(
                  onPressed: () {
                    print('กดปุ่ม Outlined');
                  },
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 10.0), // เว้นวรรคระหว่างปุ่ม
                TextButton(
                  onPressed: () {
                    print('กดปุ่ม Text');
                  },
                  child: const Text('Text'),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                print('กดไอคอน Info');
              },
              icon: const Icon(Icons.info_outline),
              iconSize: 30,
              tooltip: 'ข้อมูล', // ข้อความช่วยเหลือ
              color: const Color.fromARGB(255, 124, 124, 128),
            ),
            // Placeholder ชั่วคราว
          ],
        ),
      ),
    );
  }
}
