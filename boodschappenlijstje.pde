import controlP5.*;

ControlP5 cp5; 
ArrayList<String> shoppingList; //automatisch groeien of krimpen en biedt het gemakkelijke methoden voor het toevoegen, verwijderen en bewerken van elementen. 

//String[] hout = {"Berk", "Oerwoud", "Acacia", "Eik"};
// hout.push("Eik");

Textfield textField;
Button addItemButton;
Button destroyProductButton;
Textfield removeItemIndexField;
Button removeItemButton;


void setup() {
  size(400, 800);
  cp5 = new ControlP5(this);

  // Voeg een knop toe om items toe te voegen
  addItemButton = cp5.addButton("addItemButton")
    .setCaptionLabel("Toevoegen")
    .setSize(100, 40)
    .setPosition(50, 60);
    
  removeItemIndexField = cp5.addTextfield("RemoveItemIndexField")
    .setPosition(170, 60)
    .setText("")
    .setCaptionLabel("Verwijder op locatie")
    .setColorLabel(color(255, 255, 255))
    .setSize(50, 20);

//Button removeItemButton =
cp5.addButton("removeItemButton")
    .setCaptionLabel("Verwijder")
    .setSize(80, 30)
    .setPosition(280 ,60);

  // Voeg een tekstveld toe om items toe te voegen
  textField = cp5.addTextfield("TextInput1")
    .setPosition(50, 100)
    .setText(" ")
    .setCaptionLabel("Typ iets!")
    .setColorLabel(color(255, 225, 225));

  background(0);
  shoppingList = new ArrayList<String>();  
}

void draw() {
}
//deze methode voegt een item toe aan de boodschappenlijst
void addItemButton() {
  String newItem = textField.getText();
  if (!newItem.isEmpty()) {
    shoppingList.add(newItem);
    textField.clear();
    toonLijst();
   
  }
}
//deze methode toont de lijst voor elke verandering of als je iets verwijderd en toevoegd
void toonLijst() {
  background(0);
  fill(225, 225, 0);
  textSize(25);
  int textY = 170; // Verticale positie voor tekst
  for (String item : shoppingList) {
    text("*" + item, 25, textY);
    textY += 40; // Verhoog de verticale positie met 20 pixels voor elk item
  }
}



void removeItemButton() {
  int indexToRemove = Integer.parseInt(removeItemIndexField.getText()); // int en een string hij weet dat hij een nummer en letters moet weghalen
  indexToRemove--;

  if (indexToRemove >= 0 && indexToRemove < shoppingList.size()) { // niet kleiner 0 groter dan 0 moet iets staan om we te halen
    shoppingList.remove(indexToRemove);
    
    toonLijst();//update lijst
  }
}

void verwijderLaatsteProduct() { 
  if (!shoppingList.isEmpty()) { // zorgt ervoor dat verwijderen niet doorgaat ook al staat er niks
    shoppingList.remove(shoppingList.size() - 1); // locatie.functie 
    toonLijst(); //update
  }
}
