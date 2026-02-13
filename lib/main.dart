import 'package:flutter/material.dart'; // مكتبة الأشكال والألوان
import 'dart:math'; // مكتبة الحسابات للأرقام العشوائية

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // بيشيل علامة الـ Debug الزرقاء
    home: ValentinePage(), // بننادي على الصفحة الأساسية
  ));
}

class ValentinePage extends StatefulWidget {
  const ValentinePage({super.key});

  @override
  State<ValentinePage> createState() => _ValentinePageState();
}

class _ValentinePageState extends State<ValentinePage> {
  // --- المتغيرات (المخ) ---
  double top = 300; // مكان الزرار من فوق
  double left = 100; // مكان الزرار من الشمال
  bool accepted = false; // هل وافقت؟ (في البداية لأ)

  // --- دالة الهروب ---
  void moveNoButton() {
    setState(() { // تحديث الشاشة فوراً
      left = Random().nextInt(250).toDouble(); // رقم عشوائي للشمال
      top = Random().nextInt(500).toDouble(); // رقم عشوائي لفوق
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // لون خلفية رقيق
      body: Stack( // عشان نحط العناصر فوق بعض
        children: [
          // 1. شاشة السؤال الأساسي
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Will you be my Valentine? ❤️",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() { accepted = true; }); // تحويل الحالة لموافقة
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
          ),

          // 2. زرار الـ No اللي بيهرب (بيختفي لو دوست Yes)
          if (!accepted)
            Positioned(
              top: top,
              left: left,
              child: MouseRegion(
                onEnter: (event) => moveNoButton(), // يهرب لما الماوس يقرب (كمبيوتر)
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => moveNoButton(), // يهرب لما تلمسه (موبايل)
                  child: const Text("No", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

          // 3. شاشة الحب النهائية (رسالة نورهان)
          if (accepted)
            Container(
              color: Colors.pink[50], // بتغطي الشاشة كلها
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "NOURHAN\n I really really really really really really really really\nLove You! ❤️",
                    textAlign: TextAlign.center, // توسيط النص
                    style: TextStyle(
                      fontSize: 32, // خط كبير وواضح
                      fontWeight: FontWeight.bold, // عريض
                      fontFamily: 'Georgia', // الخط الشيك اللي اخترناه
                      color: Colors.pink[800], // وردي فخم
                      shadows: [
                        Shadow(
                          blurRadius: 15.0, // ظل ناعم
                          color: Colors.black26, // لون ظل خفيف
                          offset: Offset(3.0, 3.0), // مكان الظل
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "I wish I were with you 💖",
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic, // خط مائل للرومانسية
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}