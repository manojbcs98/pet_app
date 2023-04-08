enum Category { CAT, DOG, BUNNY, HAMSTER }
enum Condition { Adoption, Disappear, Mating }

class Pet {
  String name;
  String condition;
  Category category;
  String imageUrl;
  bool favorite;
  bool newest;
  bool isAdopted;

  Pet(this.name, this.condition, this.category, this.imageUrl, this.favorite,
      this.newest, this.isAdopted);
}

List<Pet> getPetListData() {
  return <Pet>[
    Pet("Abyssinian Cats", "Adoption", Category.CAT,
        "assets/images/cats/cat_1.jpg", true, true, false),
    Pet("Scottish Fold", "Mating", Category.CAT, "assets/images/cats/cat_2.jpg",
        false, false, false),
    Pet("Ragdoll", "Disappear", Category.CAT, "assets/images/cats/cat_3.jpg",
        false, false, false),
    Pet("Burmés", "Disappear", Category.CAT, "assets/images/cats/cat_4.jpg",
        true, true, false),
    Pet("American Shorthair", "Mating", Category.CAT,
        "assets/images/cats/cat_5.jpg", true, false, false),
    Pet("British Shorthair", "Adoption", Category.CAT,
        "assets/images/cats/cat_6.jpg", false, false, false),
    Pet("Abyssinian Cats", "Adoption", Category.CAT,
        "assets/images/cats/cat_7.jpg", true, false, false),
    Pet("Scottish Fold", "Mating", Category.CAT, "assets/images/cats/cat_8.jpg",
        false, false, false),
    Pet("Ragdoll", "Disappear", Category.CAT, "assets/images/cats/cat_9.jpg",
        false, true, false),
    Pet("Roborowski", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_1.jpg", true, true, false),
    Pet("Ruso", "Mating", Category.HAMSTER,
        "assets/images/hamsters/hamster_2.jpg", false, false, false),
    Pet("Golden", "Disappear", Category.HAMSTER,
        "assets/images/hamsters/hamster_3.jpg", false, false, false),
    Pet("Chinese", "Disappear", Category.HAMSTER,
        "assets/images/hamsters/hamster_4.jpg", true, true, false),
    Pet("Dwarf Campbell", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_5.jpg", true, false, false),
    Pet("Syrian", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_6.jpg", false, false, false),
    Pet("Dwarf Winter", "Mating", Category.HAMSTER,
        "assets/images/hamsters/hamster_7.jpg", true, false, false),
    Pet("American Rabbit", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_1.jpg", true, true, false),
    Pet("Belgian Hare Rabbit", "Mating", Category.BUNNY,
        "assets/images/bunnies/bunny_2.jpg", false, false, false),
    Pet("Blanc de Hotot", "Disappear", Category.BUNNY,
        "assets/images/bunnies/bunny_3.jpg", false, false, false),
    Pet("Californian Rabbits", "Disappear", Category.BUNNY,
        "assets/images/bunnies/bunny_4.jpg", true, true, false),
    Pet("Checkered Giant Rabbit", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_5.jpg", true, false, false),
    Pet("Dutch Rabbit", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_6.jpg", false, false, false),
    Pet("English Lop", "Mating", Category.BUNNY,
        "assets/images/bunnies/bunny_7.jpg", true, false, false),
    Pet("English Spot", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_8.jpg", true, true, false),
    Pet("Affenpinscher", "Adoption", Category.DOG,
        "assets/images/dogs/dog_1.jpg", true, true, false),
    Pet("Akita Shepherd", "Mating", Category.DOG,
        "assets/images/dogs/dog_2.jpg", false, false, false),
    Pet("American Foxhound", "Disappear", Category.DOG,
        "assets/images/dogs/dog_3.jpg", false, false, false),
    Pet("Shepherd Dog", "Disappear", Category.DOG,
        "assets/images/dogs/dog_4.jpg", true, true, false),
    Pet("Australian Terrier", "Adoption", Category.DOG,
        "assets/images/dogs/dog_5.jpg", true, false, false),
    Pet("Bearded Collie", "Adoption", Category.DOG,
        "assets/images/dogs/dog_6.jpg", false, false, false),
    Pet("Belgian Sheepdog", "Mating", Category.DOG,
        "assets/images/dogs/dog_7.jpg", true, false, false),
    Pet("Bloodhound", "Adoption", Category.DOG, "assets/images/dogs/dog_8.jpg",
        true, true, false),
    Pet("Boston Terrier", "Adoption", Category.DOG,
        "assets/images/dogs/dog_9.jpg", true, true, false),
    Pet("Chinese Shar-Pei", "Mating", Category.DOG,
        "assets/images/dogs/dog_10.jpg", false, false, false),
    Pet("Border Collie", "Disappear", Category.DOG,
        "assets/images/dogs/dog_11.jpg", false, false, false),
    Pet("Chow Chow", "Disappear", Category.DOG, "assets/images/dogs/dog_12.jpg",
        true, true, false),
  ];
}

class PetAdopted {
  static List<Pet> list = [];
}
