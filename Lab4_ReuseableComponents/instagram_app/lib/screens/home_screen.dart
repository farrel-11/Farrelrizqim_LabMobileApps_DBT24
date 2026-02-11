import 'package:flutter/material.dart';
import '../data/mockup_data.dart';
import '../widgets/instastory.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(), 
    const ChatScreen(),  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send, size: 28), 
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        title: const Text(
          "Instagram",
          style: TextStyle(fontFamily: 'Cursive', fontSize: 32, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 125, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return InstaStory(story: stories[index]);
                },
              ),
            ),
            const Divider(color: Colors.white10, thickness: 0.5),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), 
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(post.userImage),
                      ),
                      title: Text(post.username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.more_vert, color: Colors.white),
                    ),
                    Image.network(
                      post.postImage,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Icon(Icons.favorite_border, color: Colors.white, size: 28),
                          SizedBox(width: 15),
                          Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28),
                          SizedBox(width: 15),
                          Icon(Icons.send, color: Colors.white, size: 28),
                          Spacer(),
                          Icon(Icons.bookmark_border, color: Colors.white, size: 28),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${post.likes} likes", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.white),
                              children: [
                                TextSpan(text: "${post.username} ", style: const TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: post.caption),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}