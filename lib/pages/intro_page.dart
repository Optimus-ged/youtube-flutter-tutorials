import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/models/intro_page_model.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<IntroPageModel> introPages = [
    IntroPageModel(
        title: "Apartment search",
        description:
            "Very convenient selection on the map with filtering for any requirements.",
        imagePath: "assets/images/search.png"),
    IntroPageModel(
        title: "Buying real estate",
        description:
            "We select only the best options for you in accordance with your requirements.",
        imagePath: "assets/images/buying.png"),
    IntroPageModel(
        title: "Offers",
        description:
            "Thousands of real estate offers in your area tailored to your requirements.",
        imagePath: "assets/images/offers.png")
  ];

  late int indexValue;
  PageController pageController = PageController();

  @override
  void initState() {
    indexValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // top area
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 20,
                      // color: Colors.green,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            height: 10,
                            width: index == indexValue ? 60 : 20,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == indexValue
                                  ? const Color(0XFFDE923C)
                                  : Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Skip",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),

              // centered area
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      indexValue = value;
                    });
                  },
                  itemCount: introPages.length,
                  itemBuilder: (context, index) => _customPageviewItem(
                    context,
                    title: "${introPages[index].title}",
                    description: "${introPages[index].description}",
                    imagePath: "${introPages[index].imagePath}",
                  ),
                ),
              ),

              // bottom area
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (indexValue > 0) {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF122432),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (indexValue < 2) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 80,
                        width: indexValue == 0
                            ? MediaQuery.of(context).size.width * .55
                            : 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0XFFDE923C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: indexValue == 0
                            ? const Text(
                                "Start",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Icon(
                                Icons.arrow_forward,
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
      ),
    );
  }

  _customPageviewItem(context,
      {required String title,
      required String description,
      required String imagePath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          child: Image.asset(imagePath),
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
