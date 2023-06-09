import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/main_list_bloc/list_states.dart';
import 'package:test_app/ui/pet_adopt_history.dart';
import 'package:test_app/ui/pet_widget.dart';

import '../main_list_bloc/list_bloc.dart';
import '../repo_layer/data.dart';
import 'category_list.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  List<Pet> pets = getPetListData();
  List<Pet> adoptedPets = PetAdopted.list;
  final TextEditingController _searchQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: Theme.of(context),
      duration: const Duration(milliseconds: 300),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
                child: Container(
                  height: 15,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 11),
                    child: Text(
                      "Change Theme",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PetAdoptHistory(adoptedPets)),
                  );
                },
                child: Container(
                  height: 15,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 11),
                    child: Text(
                      "See Adopted Pet List",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: BlocProvider<PetListCubit>(
          create: (context) => PetListCubit(),
          child: BlocBuilder<PetListCubit, PetListStates>(
              builder: (context, state) {
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
                      "Search for",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Lovely pet according to your choice",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      onChanged: searchPets,
                      controller: _searchQuery,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildPetCategory(Category.DOG, Colors.red.shade200),
                        buildPetCategory(Category.CAT, Colors.blue.shade200),
                      ],
                    ),
                  ),
                  pets.isNotEmpty
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 6 / 10,
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 10),
                              itemCount: pets.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return PetWidget(
                                    pet: pets[index], index: index);
                              },
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                          children: [Text("No Pet Found! Adopt the Pet")],
                        )),
                ],
              );
            }
            return widget;
          }),
        ),
      ),
    );
  }

  void searchPets(String query) {
    List<Pet> petList = getPetListData();
    if (query == "") {
      setState(() {
        pets = petList;
      });
    } else {
      final suggestions = pets.where((element) {
        final petTitle = element.name.toLowerCase();
        final input = query.toLowerCase();
        return petTitle.contains(input);
      }).toList();
      setState(() {
        pets = suggestions;
      });
    }
  }

  Widget buildPetCategory(Category category, Color color) {
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
}
