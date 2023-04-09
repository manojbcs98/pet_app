import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../repo_layer/data.dart';

class PetDetail extends StatefulWidget {
  final Pet pet;

  PetDetail({required this.pet});

  @override
  State<PetDetail> createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  late ConfettiController _centerController;
  int value = 0;

  @override
  void initState() {
    super.initState();
    _centerController =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _centerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Pet> adoptedPets = PetAdopted.list;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Hero(
                  tag: widget.pet.imageUrl,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.pet.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pet.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.pet.favorite
                              ? Colors.red[400]
                              : Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 24,
                          color: widget.pet.favorite
                              ? Colors.white
                              : Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      buildPetFeature(widget.pet.age, "Age"),
                      buildPetFeature(widget.pet.price, "INR"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 56,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _centerController,
                    blastDirection: pi / 2,
                    maxBlastForce: 5,
                    minBlastForce: 1,
                    emissionFrequency: 0.03,
                    numberOfParticles: 10,
                    gravity: 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (!widget.pet.isAdopted) {
                        _centerController.play();
                        showToast("You've now Adopted " + widget.pet.name);

                        PetAdopted.list.add(Pet(
                            widget.pet.name,
                            widget.pet.condition,
                            widget.pet.category,
                            widget.pet.imageUrl,
                            widget.pet.favorite,
                            widget.pet.isAdopted = true,
                            widget.pet.price,
                            widget.pet.age));
                        Future.delayed(const Duration(seconds: 3))
                            .then((value) => Navigator.pop(context));
                      } else {}
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: widget.pet.isAdopted
                                    ? Colors.grey
                                    : Colors.blue[300]?.withOpacity(0.5) ??
                                        Colors.grey,
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 0),
                              ),
                            ],
                            color: widget.pet.isAdopted
                                ? Colors.grey
                                : Colors.blue[300],
                          ),
                          child: Text(
                            widget.pet.isAdopted
                                ? "Already Adopted"
                                : "Adopt Me",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildPetFeature(String value, String feature) {
    return Expanded(
      child: Container(
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              feature,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green.shade300,
        textColor: Colors.white);
  }
}
