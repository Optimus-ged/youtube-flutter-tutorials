import 'package:flutter/material.dart';
import 'conversation_page.dart';

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
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 100,
                bottom: 10,
              ),
              child: const Text(
                "Chats",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 100),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        10,
                                        (index) {
                                          if (index == 0) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: CircleAvatar(
                                                radius: 35,
                                                backgroundColor:
                                                    Colors.grey[300]!,
                                                child: const Text(
                                                  "+",
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          return const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: CircleAvatar(
                                              radius: 35,
                                              backgroundImage: AssetImage(
                                                "assets/images/yala.jpg",
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "All",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Family",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Buddies",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ConversationPage(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                    "assets/images/yala.jpg",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Yala Kuhanda",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("How are you ?")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
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
}
