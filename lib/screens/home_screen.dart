
import 'package:flutter/material.dart'
;
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  final List<Map<String, dynamic>> chats = const [
    {
      'name': 'Ammi ❤️',
      'message': 'Allah apko khush rakhe',
      'time': '3:42 PM',
      'unread': 2,
      'color': Colors.pink,
      'icon': Icons.favorite,
    },
    {
      'name': 'Best Friend 🌸',
      'message': 'Send me the pictures!',
      'time': '3:20 PM',
      'unread': 3,
      'color': Colors.purple,
      'icon': Icons.person,
    },
    {
      'name': 'Flutter Developers',
      'message': 'Ali: Check out this new UI',
      'time': '2:55 PM',
      'unread': 0,
      'color': Colors.blue,
      'icon': Icons.code,
    },
    {
      'name': 'Anashra',
      'message': 'Okay, see you soon!',
      'time': '1:30 PM',
      'unread': 1,
      'color': Colors.orange,
      'icon': Icons.person,
    },
    {
      'name': 'Study Group 📚',
      'message': 'Sara: Notes uploaded',
      'time': '12:15 PM',
      'unread': 0,
      'color': Colors.teal,
      'icon': Icons.groups,
    },
    {
      'name': 'Hira',
      'message': 'Thank you so much 😊',
      'time': 'Yesterday',
      'unread': 0,
      'color': Colors.indigo,
      'icon': Icons.person,
    },
    {
      'name': 'Flutter Community',
      'message': 'You: Working on my new project',
      'time': 'Yesterday',
      'unread': 0,
      'color': Colors.green,
      'icon': Icons.developer_mode,
    },
    {
      'name': 'Ayesha',
      'message': 'In Sha Allah ❤️',
      'time': 'Yesterday',
      'unread': 0,
      'color': Colors.deepOrange,
      'icon': Icons.person,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        elevation: 0,
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: const Color(0xFF075E54),
            child: const Row(
              children: [
                SizedBox(width: 16),
                Icon(Icons.groups, color: Colors.white70),
                SizedBox(width: 25),
                Text(
                  'CHATS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 28),
                Text(
                  'UPDATES',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(width: 28),
                Text(
                  'CALLS',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            color: const Color(0xFFF6F6F6),
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ask Meta AI or Search',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.archive_outlined,
              color: Colors.grey,
            ),
            title: const Text(
              'Archived',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            dense: true,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 3,
                  ),
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: chat['color'],
                    child: Icon(
                      chat['icon'],
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  title: Text(
                    chat['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      chat['message'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chat['time'],
                        style: TextStyle(
                          fontSize: 11,
                          color: chat['unread'] > 0
                              ? const Color(0xFF128C7E)
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 6),
                      if (chat['unread'] > 0)
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Color(0xFF25D366),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${chat['unread']}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Opening ${chat['name']}...',
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF075E54),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
