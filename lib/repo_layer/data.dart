enum Category { CAT, DOG, BUNNY, HAMSTER }
enum Condition { Adoption, Disappear, Mating }

class Pet {
  String name;
  String condition;
  Category category;
  String imageUrl;
  bool favorite;
  bool isAdopted;
  String price;
  String age;

  Pet(this.name, this.condition, this.category, this.imageUrl, this.favorite,
      this.isAdopted, this.price, this.age);
}

List<Pet> getPetListData() {
  return <Pet>[
    Pet("Ragdoll", "Disappear", Category.CAT, "assets/images/cats/cat_9.jpg",
        false, false, "2340", "24"),
    Pet("Roborowski", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_1.jpg", true, false, "2344", "24"),
    Pet("Ruso", "Mating", Category.HAMSTER,
        "assets/images/hamsters/hamster_2.jpg", false, false, "34456", "24"),
    Pet("Golden", "Disappear", Category.HAMSTER,
        "assets/images/hamsters/hamster_3.jpg", false, false, "67890", "24"),
    Pet("Chinese", "Disappear", Category.HAMSTER,
        "assets/images/hamsters/hamster_4.jpg", true, false, "35900", "24"),
    Pet("Dwarf Campbell", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_5.jpg", true, false, "24534", "22"),
    Pet("Syrian", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_6.jpg", false, false, "2345", "14"),
    Pet("Australian Terrier", "Adoption", Category.DOG,
        "assets/images/dogs/dog_5.jpg", true, false, "23221", "21"),
    Pet("Bearded Collie", "Adoption", Category.DOG,
        "assets/images/dogs/dog_6.jpg", false, false, "12345", "23"),
    Pet("Belgian Sheepdog", "Mating", Category.DOG,
        "assets/images/dogs/dog_7.jpg", true, false, "2451", "11"),
    Pet("Bloodhound", "Adoption", Category.DOG, "assets/images/dogs/dog_8.jpg",
        true, true, "87654", "10"),
    Pet("Boston Terrier", "Adoption", Category.DOG,
        "assets/images/dogs/dog_9.jpg", true, false, "98765", "23"),
    Pet("Chinese Shar-Pei", "Mating", Category.DOG,
        "assets/images/dogs/dog_10.jpg", false, false, "45678", "23"),
    Pet("Border Collie", "Disappear", Category.DOG,
        "assets/images/dogs/dog_11.jpg", false, false, "7654", "23"),
    Pet("Chow Chow", "Disappear", Category.DOG, "assets/images/dogs/dog_12.jpg",
        true, false, "234", "5"),
    Pet("Dwarf Winter", "Mating", Category.HAMSTER,
        "assets/images/hamsters/hamster_7.jpg", true, false, "98765", "12"),
    Pet("American Rabbit", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_1.jpg", true, false, "23533", "03"),
    Pet("Belgian Hare Rabbit", "Mating", Category.BUNNY,
        "assets/images/bunnies/bunny_2.jpg", false, false, "7532", "12"),
    Pet("Blanc de Hotot", "Disappear", Category.BUNNY,
        "assets/images/bunnies/bunny_3.jpg", false, false, "167900", "2"),
    Pet("Californian Rabbits", "Disappear", Category.BUNNY,
        "assets/images/bunnies/bunny_4.jpg", true, true, "34543", "1"),
    Pet("Checkered Giant Rabbit", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_5.jpg", true, false, "1345", "1"),
    Pet("Dutch Rabbit", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_6.jpg", false, false, "2345", "1"),
    Pet("English Lop", "Mating", Category.BUNNY,
        "assets/images/bunnies/bunny_7.jpg", true, false, "6541", "2"),
    Pet("English Spot", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_8.jpg", true, false, "1900", "4"),
    Pet("Affenpinscher", "Adoption", Category.DOG,
        "assets/images/dogs/dog_1.jpg", true, true, "20010", "7"),
    Pet("American samoa", "Adoption", Category.CAT,
        "assets/images/cats/cat_1.jpg", true, false, "11000", "21"),
    Pet("Scottish Fold", "Mating", Category.CAT, "assets/images/cats/cat_2.jpg",
        false, false, "11000", "12"),
    Pet("Ragdoll", "Disappear", Category.CAT, "assets/images/cats/cat_3.jpg",
        false, false, "11000", "22"),
    Pet("Burmés", "Disappear", Category.CAT, "assets/images/cats/cat_4.jpg",
        true, false, "2300", "23"),
    Pet("American Shorthair", "Mating", Category.CAT,
        "assets/images/cats/cat_5.jpg", true, false, "2300", "24"),
    Pet("British Shorthair", "Adoption", Category.CAT,
        "assets/images/cats/cat_6.jpg", false, false, "23100", "24"),
    Pet("Abyssinian Cats", "Adoption", Category.CAT,
        "assets/images/cats/cat_7.jpg", true, false, "500", "24"),
    Pet("Scottish Fold", "Mating", Category.CAT, "assets/images/cats/cat_8.jpg",
        false, false, "10011", "24"),
    Pet("Akita Shepherd", "Mating", Category.DOG,
        "assets/images/dogs/dog_2.jpg", false, false, "30000", "3"),
    Pet("American Foxhound", "Disappear", Category.DOG,
        "assets/images/dogs/dog_3.jpg", false, false, "2345", "3"),
    Pet("Shepherd Dog", "Disappear", Category.DOG,
        "assets/images/dogs/dog_4.jpg", true, false, "6542", "22"),
  ];
}

class PetAdopted {
  static List<Pet> list = [];
}
