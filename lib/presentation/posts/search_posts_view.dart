import 'package:flutter/material.dart';

class SearchPostsView extends StatelessWidget {
  const SearchPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.amber[800],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search posts...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.amber[800],
                          ),
                          filled: true,
                          fillColor: Colors.amber[100],
                          focusedBorder: buildoutlineInputBorder(),
                          enabledBorder: buildoutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Scrollbar(
                  radius: const Radius.circular(30),
                  child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) => buildSearchWidget(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildSearchWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text("search result..."),
      ),
    );
  }

  buildoutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 0.1,
      ),
      gapPadding: 10,
    );
  }
}
