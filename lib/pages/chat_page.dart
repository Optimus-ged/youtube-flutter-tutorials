import 'package:flutter/material.dart';
import 'conversations_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // chat text area
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 100, bottom: 10),
              child: Text(
                "Chats",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),

            // conversations area
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 20,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _myContacts();
                      }
                      return _customConversationItem(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _customConversationItem(context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ConversationPage(),
        ));
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SizedBox(
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/images/yala.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    "Yala kuhanda",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("How are you?")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _myContacts() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          // people images area
          SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(
                  10,
                  (index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey[200],
                          child: const Text(
                            "+",
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      );
                    }

                    return const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/images/yala.jpg"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // titles area
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Family",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Buddies",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
