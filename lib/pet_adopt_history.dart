import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/adopted_pet_history_bloc/pet_history_states.dart';
import 'package:test_app/pet_widget.dart';

import 'adopted_pet_history_bloc/pet_history_list_bloc.dart';
import 'data.dart';

class PetAdoptHistory extends StatefulWidget {
  final List<Pet> petList;

  const PetAdoptHistory(this.petList, {Key? key}) : super(key: key);

  @override
  State<PetAdoptHistory> createState() => _PetAdoptHistoryState();
}

class _PetAdoptHistoryState extends State<PetAdoptHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
              child: Icon(Icons.arrow_back, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: BlocProvider<PetHistoryListCubit>(
          create: (context) => PetHistoryListCubit(),
          child: BlocBuilder<PetHistoryListCubit, PetHistoryListStates>(
              builder: (context, state) {
            Widget widget = Container();
            if (state is InitialPetHistoryListState) {
              return widget;
            }
            if (state is LoadingPetHistoryListState) {
              widget = CircularProgressIndicator();
            }
            if (state is LoadedPetHistoryListState) {
              List<Pet> list = state.petList;
              if (list.isNotEmpty) {
                widget = Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
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
                );
              } else {
                widget = Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                      child: Column(
                    children: [
                      Image.asset('assets/no_data.jpg'),
                      Text("No Pet Found! Adopt the Pet")
                    ],
                  )),
                );
              }
            }
            return widget;
          }),
        ));
  }
}
