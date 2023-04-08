import 'package:flutter/material.dart';
import 'package:test_app/pet_widget.dart';

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
      appBar: AppBar(title: Text("Adopted Pets List")),
      body: widget.petList.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      childAspectRatio: 1 / 1.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      children: widget.petList.map((item) {
                        return PetWidget(
                          pet: item,
                          index: -1,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              color: Colors.red,
              height: 20,
            ),
    );
  }
}
