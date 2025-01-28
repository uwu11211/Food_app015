import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => Pedo();
}

class Pedo extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แนะนำอาหารและของว่าง',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => FoodSnackPage();
}

class FoodSnackPage extends State<BottomNavigationBarExample> {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'ลาบอีสาน',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/9/97/Lap_mu_isan.JPG',
      'description':
          'ลาบอีสาน เป็นอาหารไทยที่มีรสจัดจ้านจากเครื่องเทศและสมุนไพร ลาบอีสานเป็นอาหารที่ปรุงโดยใช้เนื้อสัตว์ที่สับละเอียด ซอยหรือหั่นเป็นชิ้นเล็ก ๆ ปรุงรสด้วย น้ำปลา มะนาว และ โรย ข้าวคั่ว พริกป่น ใบสระแหน่ ต้นหอมและหอมแดง มีทั้งที่ใช้เนื้อสัตว์สุกและดิบ กินกับพืชผักพื้นบ้าน เช่นแตงกวา ยอดกระถิน ลิ้นฟ้า ยอดมะกอก ยอดมะเฟือง ยอดมะตูม ยอดสะเดา เป็นต้น',
      'youtubeUrl': 'https://youtu.be/oNofTNM_Kjs?si=B13gOsnatSINTKtN',
    },
    {
      'name': 'ไก่ทอด',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Fried_Chicken_%28Unsplash%29.jpg/1200px-Fried_Chicken_%28Unsplash%29.jpg',
      'description':
          'เนื้อไก่ นำไปคลุกกับแป้งและส่วนผสมอื่น ๆ จากนั้นนำไปทอด อาจด้วยวิธีการทอดน้ำมันท่วม น้ำมันน้อย หรือการทอดด้วยความดัน ผิวนอกของไก่ทอดจะกรอบ ส่วนของไก่ที่นำมาทำไก่ทอดอาจเป็นน่อง ปีก อก หรือเนื้อไก่ที่หั่นเป็นชิ้น ๆ อาจมีหนัง มีกระดูกหรือเลาะกระดูกออกก่อน (เป็นไก่ไม่มีกระดูก) รูปแบบของไก่ทอดนั้นไม่ตายตัว โดยขึ้นอยู่กับสูตร ส่วนผสม และกรรมวิธีการปรุง',
      'youtubeUrl': 'https://youtu.be/fXpUn1uP84s?si=Oyq4F70jMhkLBtYp',
    },
    {
      'name': 'ข้าวผัด',
      'image':
          'https://i0.wp.com/arinfood.com/wp-content/uploads/2021/04/0000005_fried_rice_culture_and_boundless_imagination_thai_crab_fried_rice.jpg?resize=580%2C435&ssl=1',
      'description':
          'เป็นการนำข้าวสวยลงไปผัดคลุกกับซอส หรือน้ำพริก หรือเครื่องปรุงรสต่างๆ เพื่อให้ได้รสชาติ เช่น ซอสมะเขือเทศ, ซอสพริก, ซีอิ๊วดำ หรือซอสถั่วเหลือง และมีการใส่เนื้อสัตว์ชนิดต่างๆ ลงไป เช่น หมู, ไก่, ปลาหมึก, ปู และกุ้ง เป็นต้น โดยเรียกชื่อข้าวผัดชนิดนั้น ๆ ตามชื่อเนื้อสัตว์ที่ใส่ลงไป และอาจใส่ไข่ลงไปผสมด้วย',
      'youtubeUrl': 'https://youtu.be/chwvx3YdXfA?si=JAFvqqdPQ0UmnxFv',
    },
    {
      'name': 'ผัดไทย',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/4/4c/%E0%B9%82%E0%B8%95%E0%B9%8A%E0%B8%B0%E0%B8%88%E0%B8%B5%E0%B8%99%E0%B8%9C%E0%B8%B1%E0%B8%94%E0%B9%84%E0%B8%97%E0%B8%A2.jpg',
      'description':
          'ผัดไทยโดยทั่วไปจะนำเส้นเล็กมาผัดด้วยไฟแรงกับไข่ ใบกุยช่ายสับ ถั่วงอก หัวไชโป๊สับ เต้าหู้เหลือง ถั่วลิสงคั่ว และกุ้งแห้ง ปรุงรสด้วยพริก น้ำปลา และน้ำตาล เสิร์ฟพร้อมกับมะนาว ใบกุยช่าย ถั่วงอกสด และหัวปลีเป็นเครื่องเคียง ร้านผัดไทยบางแห่งจะใส่เนื้อหมูลงไปด้วย ',
      'youtubeUrl': 'https://youtu.be/AvR_dM6qsWM?si=IhYCs3pKTt0zrzu6',
    },
  ];

  final List<Map<String, String>> snackItems = [
    {
      'name': 'เลย์',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Tayto_cheese_and_onion_crisps.jpg/220px-Tayto_cheese_and_onion_crisps.jpg',
      'description':
          'เลย์ เป็นขนมขบเคี้ยวที่ทำจากมันฝรั่งทอด ส่วนประกอบที่สำคัญโดยประมาณ มันฝรั่ง 60.1%, น้ำมันพืช 32.9%, เครื่องปรุงรส 7%, (วัตถุปรุงแต่งรสอาหาร, สารเพิ่มปริมาณ, สารควบคุมความเป็นกรด, สารป้องกันการจับเป็นก้อน, สีธรรมชาติ, วัตถุที่ให้ความหวานแทนน้ำตาล, ก๊าซที่ช่วยในการเก็บรักษาอาหาร) แต่งกลิ่นเลียนธรรมชาติ ไม่ใช้วัตถุกันเสีย',
      'youtubeUrl': 'https://youtu.be/iDkBmWMR2CU?si=-SuXVTAFyRt_bfuU',
    },
    {
      'name': 'กาแฟ',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/800px-A_small_cup_of_coffee.JPG',
      'description': 'กาแฟ เป็นเครื่องดื่มที่ทำจากเมล็ดกาแฟบดและน้ำร้อน',
      'youtubeUrl': 'https://youtu.be/w3A_Z1J78HY?si=tEdkumGXwWAHFIqD',
    },
    {
      'name': 'ขนมปัง',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Brood.jpg',
      'description':
          'ขนมปัง เป็นอาหารที่ทำจากแป้งและยีสต์อบจนสุก ส่วนผสม แป้งสาลี ยีสต์ น้ำ เกลือ น้ำตาล (อาจใส่หรือไม่ก็ได้) ไข่ไก่ (อาจใส่หรือไม่ก็ได้) ไขมัน (อาจใส่หรือไม่ก็ได้) วัตถุดิบเพิ่มรสชาติ หรือ texture  สารเสริมคุณภาพ',
      'youtubeUrl': 'https://youtu.be/2tMMJnWdLew?si=Wr1IS34wVeFBPZLz',
    },
  ];

  // ignore: unused_field
  int _selectedIndex = 0;
  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
  final Map<String, String> ite m;
  final List<Map<String, String>> items;

  const DetailPage({super.key, required this.item, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ignore: non_constant_identifier_names
  Future<void> _launchYouTube(String Url) async {
    final Uri url = Uri.parse(Url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
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
            const SizedBox(height: 10),
            Text(
              widget.item['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.item['description']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up, color: Colors.green),
                  onPressed: _likeItem,
                ),
                Text('Likes: $likeCount'),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.thumb_down, color: Colors.red),
                  onPressed: _dislikeItem,
                ),
                Text('Dislikes: $dislikeCount'),
              ],
            ),

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

            // ปุ่มดู YouTube0
            ElevatedButton(
              onPressed: () => _launchYouTube(youtubeUrl),
              child: const Text("ดูวิดีโอบน YouTube"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
