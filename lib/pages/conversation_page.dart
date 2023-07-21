import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  List<ConversationModel> conversations = [
    ConversationModel(
      id: 1,
      message: "Hi Yala",
      messageType: MessageType.friend,
    ),
    ConversationModel(
      id: 1,
      message: "I'm jason, here to help you find new friends",
      messageType: MessageType.friend,
    ),
    ConversationModel(
      id: 1,
      message: "Photography",
      messageType: MessageType.me,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          // color: Colors.green,
          padding: const EdgeInsets.only(left: 10, right: 20, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yala Kuhanda",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Online",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  "assets/images/yala.jpg",
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: conversations.length + 1,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 100,
                ),
                itemBuilder: (context, index) {
                  if (index + 1 == conversations.length + 1) {
                    return UnconstrainedBox(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.9),
                              ),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.6),
                              ),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return UnconstrainedBox(
                    alignment:
                        conversations[index].messageType == MessageType.friend
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .5,
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: conversations[index].messageType ==
                                MessageType.friend
                            ? Colors.white
                            : Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "${conversations[index].message}",
                        style: TextStyle(
                          color: conversations[index].messageType ==
                                  MessageType.friend
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(
                    Icons.sentiment_satisfied_outlined,
                    size: 40,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Center(
                      child: TextFormField(
                        maxLines: 4,
                        minLines: 1,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Type message",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ConversationModel {
  int? id;
  String? message;
  MessageType? messageType;

  ConversationModel({this.id, this.message, this.messageType});
}

enum MessageType { me, friend }
