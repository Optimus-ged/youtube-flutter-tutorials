import 'package:flutter/material.dart';

class SearchPostView extends StatelessWidget {
  const SearchPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
                          hintText: "Search post",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.amber[800],
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: buildOutLineBorder(),
                          enabledBorder: buildOutLineBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) => const Text("data"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildOutLineBorder() {
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
