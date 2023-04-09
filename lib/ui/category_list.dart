import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/ui/pet_widget.dart';

import '../repo_layer/data.dart';

class CategoryList extends StatelessWidget {
  final Category category;

  CategoryList({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          (category == Category.HAMSTER
                  ? "Hamster"
                  : category == Category.CAT
                      ? "Cat"
                      : category == Category.BUNNY
                          ? "Bunny"
                          : "Dog") +
              " Category",
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                childAspectRatio: 1 / 1.55,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                children: getPetListData()
                    .where((i) => i.category == category)
                    .map((item) {
                  return PetWidget(
                    pet: item,
                    index: -1,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
