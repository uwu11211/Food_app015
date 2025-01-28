import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // เพิ่มการนำเข้า url_launcher

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แนะนำอาหารและของว่าง',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodSnackPage(),
    );
  }
}

class FoodSnackPage extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'ลาบอีสาน',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/9/97/Lap_mu_isan.JPG',
      'description':
          'ลาบอีสาน เป็นอาหารไทยที่มีรสจัดจ้านจากเครื่องเทศและสมุนไพร...',
      'youtubeUrl':
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // เพิ่มลิงก์ YouTube
    },
    {
      'name': 'ไก่ทอด',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Fried_Chicken_%28Unsplash%29.jpg/1200px-Fried_Chicken_%28Unsplash%29.jpg',
      'description':
          'เนื้อไก่ นำไปคลุกกับแป้งและส่วนผสมอื่น ๆ จากนั้นนำไปทอด...',
      'youtubeUrl':
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // เพิ่มลิงก์ YouTube
    },
    {
      'name': 'ข้าวผัด',
      'image':
          'https://i0.wp.com/arinfood.com/wp-content/uploads/2021/04/0000005_fried_rice_culture_and_boundless_imagination_thai_crab_fried_rice.jpg?resize=580%2C435&ssl=1',
      'description': 'เป็นการนำข้าวสวยลงไปผัดคลุกกับซอส หรือน้ำพริก...',
      'youtubeUrl':
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // เพิ่มลิงก์ YouTube
    },
    {
      'name': 'ผัดไทย',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/4/4c/%E0%B9%82%E0%B8%95%E0%B8%BA%E0%B8%88%E0%B8%B5%E0%B8%99%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%97%E0%B8%A2.jpg',
      'description': 'ผัดไทยโดยทั่วไปจะนำเส้นเล็กมาผัดด้วยไฟแรง...',
      'youtubeUrl':
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // เพิ่มลิงก์ YouTube
    },
  ];

  final List<Map<String, String>> snackItems = [
    {
      'name': 'เลย์',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Tayto_cheese_and_onion_crisps.jpg/220px-Tayto_cheese_and_onion_crisps.jpg',
      'description': 'เลย์ เป็นขนมขบเคี้ยวที่ทำจากมันฝรั่งทอด...',
      'youtubeUrl':
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // เพิ่มลิงก์ YouTube
    },
    {
      'name': 'กาแฟ',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/800px-A_small_cup_of_coffee.JPG',
      'description': 'กาแฟ เป็นเครื่องดื่มที่ทำจากเมล็ดกาแฟบดและน้ำร้อน...',
      'youtubeUrl':
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // เพิ่มลิงก์ YouTube
    },
    {
      'name': 'ขนมปัง',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Brood.jpg',
      'description': 'ขนมปัง เป็นอาหารที่ทำจากแป้งและยีสต์อบจนสุก...',
      'youtubeUrl':
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // เพิ่มลิงก์ YouTube
    },
  ];

  FoodSnackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แนะนำอาหารและของว่าง ของ ศิวกร'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('อาหารที่ชื่นชอบ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: foodItems.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(item: item, items: foodItems),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(blurRadius: 5, color: Colors.grey)
                        ],
                        image: DecorationImage(
                          image: NetworkImage(item['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            item['name']!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(item: item, items: foodItems),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('ของว่าง',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: snackItems.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(item: item, items: snackItems),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(blurRadius: 5, color: Colors.grey)
                        ],
                        image: DecorationImage(
                          image: NetworkImage(item['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            item['name']!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(item: item, items: snackItems),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final Map<String, String> item;
  final List<Map<String, String>> items;

  const DetailPage({super.key, required this.item, required this.items});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันเปิดลิงก์ YouTube
  Future<void> _launchYouTube(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _likeItem() {
    setState(() {
      likeCount++;
    });
  }

  void _dislikeItem() {
    setState(() {
      dislikeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ลิงก์ YouTube สำหรับเมนูอาหาร
    String youtubeUrl = widget.item['youtubeUrl']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['name']!),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(widget.item['image']!),
            const SizedBox(height: 20),
            Text(
              widget.item['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.item['description']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up, color: Colors.green),
                  onPressed: _likeItem,
                ),
                Text('Likes: $likeCount'),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.thumb_down, color: Colors.red),
                  onPressed: _dislikeItem,
                ),
                Text('Dislikes: $dislikeCount'),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                        item: widget.items[
                            (widget.items.indexOf(widget.item) + 1) %
                                widget.items.length],
                        items: widget.items),
                  ),
                );
              },
              child: const Text("หน้าถัดไป"),
            ),
            const SizedBox(height: 20),
            // ปุ่มดู YouTube
            ElevatedButton(
              onPressed: () => _launchYouTube(youtubeUrl),  
              child: const Text("ดูวิดีโอบน YouTube"),
            ),
          ],
        ),
      ),
    );
  }
}
