enum Category { CAT, DOG, BUNNY, HAMSTER }
enum Condition { Adoption, Disappear, Mating }

class Pet {
  String name;
  String location;
  String distance;
  String condition;
  Category category;
  String imageUrl;
  bool favorite;
  bool newest;
  bool isAdopted;

  Pet(this.name, this.location, this.distance, this.condition, this.category,
      this.imageUrl, this.favorite, this.newest, this.isAdopted);
}

List<Pet> getPetListData() {
  return <Pet>[
    Pet("Abyssinian Cats", "California", "2.5", "Adoption", Category.CAT,
        "assets/images/cats/cat_1.jpg", true, true, false),
    Pet("Scottish Fold", "New Jersey", "1.2", "Mating", Category.CAT,
        "assets/images/cats/cat_2.jpg", false, false, false),
    Pet("Ragdoll", "Miami", "1.2", "Disappear", Category.CAT,
        "assets/images/cats/cat_3.jpg", false, false, false),
    Pet("Burmés", "Chicago", "1.2", "Disappear", Category.CAT,
        "assets/images/cats/cat_4.jpg", true, true, false),
    Pet("American Shorthair", "Washintong", "1.2", "Mating", Category.CAT,
        "assets/images/cats/cat_5.jpg", true, false, false),
    Pet("British Shorthair", "New York", "1.9", "Adoption", Category.CAT,
        "assets/images/cats/cat_6.jpg", false, false, false),
    Pet("Abyssinian Cats", "California", "2.5", "Adoption", Category.CAT,
        "assets/images/cats/cat_7.jpg", true, false, false),
    Pet("Scottish Fold", "New Jersey", "1.2", "Mating", Category.CAT,
        "assets/images/cats/cat_8.jpg", false, false, false),
    Pet("Ragdoll", "Miami", "1.2", "Disappear", Category.CAT,
        "assets/images/cats/cat_9.jpg", false, true, false),
    Pet("Roborowski", "California", "2.5", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_1.jpg", true, true, false),
    Pet("Ruso", "New Jersey", "2.5", "Mating", Category.HAMSTER,
        "assets/images/hamsters/hamster_2.jpg", false, false, false),
    Pet("Golden", "Miami", "2.5", "Disappear", Category.HAMSTER,
        "assets/images/hamsters/hamster_3.jpg", false, false, false),
    Pet("Chinese", "Chicago", "2.5", "Disappear", Category.HAMSTER,
        "assets/images/hamsters/hamster_4.jpg", true, true, false),
    Pet("Dwarf Campbell", "New York", "2.5", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_5.jpg", true, false, false),
    Pet("Syrian", "California", "2.5", "Adoption", Category.HAMSTER,
        "assets/images/hamsters/hamster_6.jpg", false, false, false),
    Pet("Dwarf Winter", "Miami", "2.5", "Mating", Category.HAMSTER,
        "assets/images/hamsters/hamster_7.jpg", true, false, false),
    Pet("American Rabbit", "California", "2.5", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_1.jpg", true, true, false),
    Pet("Belgian Hare Rabbit", "New Jersey", "2.5", "Mating", Category.BUNNY,
        "assets/images/bunnies/bunny_2.jpg", false, false, false),
    Pet("Blanc de Hotot", "Miami", "2.5", "Disappear", Category.BUNNY,
        "assets/images/bunnies/bunny_3.jpg", false, false, false),
    Pet("Californian Rabbits", "Chicago", "2.5", "Disappear", Category.BUNNY,
        "assets/images/bunnies/bunny_4.jpg", true, true, false),
    Pet("Checkered Giant Rabbit", "New York", "2.5", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_5.jpg", true, false, false),
    Pet("Dutch Rabbit", "California", "2.5", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_6.jpg", false, false, false),
    Pet("English Lop", "Miami", "2.5", "Mating", Category.BUNNY,
        "assets/images/bunnies/bunny_7.jpg", true, false, false),
    Pet("English Spot", "California", "2.5", "Adoption", Category.BUNNY,
        "assets/images/bunnies/bunny_8.jpg", true, true, false),
    Pet("Affenpinscher", "California", "2.5", "Adoption", Category.DOG,
        "assets/images/dogs/dog_1.jpg", true, true, false),
    Pet("Akita Shepherd", "New Jersey", "2.5", "Mating", Category.DOG,
        "assets/images/dogs/dog_2.jpg", false, false, false),
    Pet("American Foxhound", "Miami", "2.5", "Disappear", Category.DOG,
        "assets/images/dogs/dog_3.jpg", false, false, false),
    Pet("Shepherd Dog", "Chicago", "2.5", "Disappear", Category.DOG,
        "assets/images/dogs/dog_4.jpg", true, true, false),
    Pet("Australian Terrier", "New York", "2.5", "Adoption", Category.DOG,
        "assets/images/dogs/dog_5.jpg", true, false, false),
    Pet("Bearded Collie", "California", "2.5", "Adoption", Category.DOG,
        "assets/images/dogs/dog_6.jpg", false, false, false),
    Pet("Belgian Sheepdog", "Miami", "2.5", "Mating", Category.DOG,
        "assets/images/dogs/dog_7.jpg", true, false, false),
    Pet("Bloodhound", "California", "2.5", "Adoption", Category.DOG,
        "assets/images/dogs/dog_8.jpg", true, true, false),
    Pet("Boston Terrier", "California", "2.5", "Adoption", Category.DOG,
        "assets/images/dogs/dog_9.jpg", true, true, false),
    Pet("Chinese Shar-Pei", "New Jersey", "2.5", "Mating", Category.DOG,
        "assets/images/dogs/dog_10.jpg", false, false, false),
    Pet("Border Collie", "Miami", "2.5", "Disappear", Category.DOG,
        "assets/images/dogs/dog_11.jpg", false, false, false),
    Pet("Chow Chow", "Chicago", "2.5", "Disappear", Category.DOG,
        "assets/images/dogs/dog_12.jpg", true, true, false),
  ];
}

class PetAdopted {
  static List<Pet> list = [];
}
