import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/main_list_bloc/list_states.dart';
import 'package:test_app/pet_adopt_history.dart';
import 'package:test_app/pet_widget.dart';

import 'category_list.dart';
import 'data.dart';
import 'drawer.dart';
import 'main_list_bloc/list_bloc.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<Pet> pets = getPetListData();
  List<Pet> adoptedPets = PetAdopted.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AppDrawer()));
          },
          child: Icon(
            Icons.sort,
            color: Colors.grey[800],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PetAdoptHistory(adoptedPets)),
                );
              },
              child: Icon(
                Icons.history,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: BlocProvider<PetListCubit>(
        create: (context) => PetListCubit(),
        child:
            BlocBuilder<PetListCubit, PetListStates>(builder: (context, state) {
          Widget widget = Container();
          if (state is InitialPetListState) {
            widget = widget;
          }
          if (state is LoadingPetListState) {
            widget = const CircularProgressIndicator();
          }
          if (state is LoadedPetListState) {
            List<Pet> list = state.petList;
            widget = Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Find Your",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Lovely pet in anywhere",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.only(
                        right: 30,
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 24.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildPetCategory(
                              Category.BUNNY, "90", Colors.green.shade200),
                          buildPetCategory(
                              Category.CAT, "210", Colors.blue.shade200),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildPetCategory(
                              Category.DOG, "340", Colors.red.shade200),
                          buildPetCategory(
                              Category.HAMSTER, "56", Colors.orange.shade200),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      childAspectRatio: 1 / 1.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      children: list.map((item) {
                        return PetWidget(
                          pet: item,
                          index: -1,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }
          return widget;
        }),
      ),
    );
  }

  Widget buildPetCategory(Category category, String total, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryList(category: category)),
          );
        },
        child: Container(
          height: 80,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/" +
                          (category == Category.HAMSTER
                              ? "hamster"
                              : category == Category.CAT
                                  ? "cat"
                                  : category == Category.BUNNY
                                      ? "bunny"
                                      : "dog") +
                          ".png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category == Category.HAMSTER
                        ? "Hamsters"
                        : category == Category.CAT
                            ? "Cats"
                            : category == Category.BUNNY
                                ? "Bunnies"
                                : "Dogs",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total of " + total,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNewestPet() {
    List<Widget> list = [];
    for (var i = 0; i < pets.length; i++) {
      if (pets[i].newest) {
        list.add(PetWidget(pet: pets[i], index: i));
      }
    }
    return list;
  }
}
