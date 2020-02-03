# Tutorial

## 0. Starter

```git checkout "starter"```

Review existing content

## 1. Static list

#### `-> ContentView.swift`
```Swift
List {
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
}
```

## 2. Navigation View
```Swift
NavigationView {
    List {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
    }
}
```

## 3. Navigation Bar Title
```Swift
NavigationView {
    List {
        Text("Hello World")
        Text("Hello World")
        Text("Hello World")
    }
    .navigationBarTitle("Professions")
}
```

## 4. ForEach
```Swift
private let professionBooks = Database.professionBooks
```

```Swift
NavigationView {
    List {
        ForEach(professionBooks) { book in
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
        }
    }
    .navigationBarTitle("Professions")
}
```
#### `-> Compile`

## 5. Identifiable

#### `-> Profession.swift`
```Swift
struct ProfessionBook: Codable, Identifiable {
```
```Swift
struct Profession: Codable, Equatable, Identifiable {
```

## 6. Book names
#### `-> ContentView.swift`
```Swift
ForEach(professionBooks) { book in
    Text(book.name)
}
```

## 7. Profession names
```Swift
List {
    ForEach(professionBooks) { book in
        Text(book.name)
        
        ForEach(book.professions) { profession in
            Text(profession.name)
        }
    }
}
```

## 8. Sections
```Swift
List {
    ForEach(professionBooks) { book in
        Section(header: Text(book.name)) {
            ForEach(book.professions) { profession in
                Text(profession.name)
            }
        }
    }
}
```

## 9. List style
```Swift
List {
    ...
}
.navigationBarTitle("Professions")
.listStyle(GroupedListStyle())
```

## 10. Create Profession Row
#### `CMD+N -> SwiftUI View -> ProfessionRow.swift`
```Swift
struct ProfessionRow: View {
    let profession: Profession
    
    var body: some View {
        Text(profession.name)
    }
}
```

## 11. Add example profession to preview
```Swift
 struct ProfessionRow_Previews: PreviewProvider {
     static var previews: some View {
        ProfessionRow(profession: Profession.example)
     }
 }
```

## 12. Add ProfessionRow to ContentView
#### `-> ContentView.swift`
```Swift
ForEach(professionBooks) { book in
    Section(header: Text(book.name)) {
        ForEach(book.professions) { profession in
            ProfessionRow(profession: profession)
        }
    }
}
```

## 13. Two views in body
#### `-> ProfessionRow.swift`
```Swift
var body: some View {
    Image(profession.icon)
    Text(profession.name)
}
```
#### `-> Compile`
## 14. HStack
```Swift
HStack {
    Image(profession.icon)
    Text(profession.name)
    Text("HP: \(profession.hitDie)")
    Text(profession.ability)
}
```

## 15. Resize Image
```Swift
Image(profession.icon)
    .resizable()
    .scaledToFit()
    .frame(height: 40)
    .cornerRadius(5)
```

## 16. VStack
```Swift
HStack {
    Image(profession.icon)
    VStack {
        Text(profession.name)
        Text("HP: \(profession.hitDie)")
    }
    Text(profession.ability)
}
```

## 17. VStack alignment
```Swift
VStack(alignment: .leading) {
    ...
}
```

## 18. Show list in preview
```Swift
 struct ProfessionRow_Previews: PreviewProvider {
     static var previews: some View {
        NavigationView {
            List {
                ProfessionRow(profession: Profession.example)
                ProfessionRow(profession: Profession.example)
                ProfessionRow(profession: Profession.example)
            }
            .navigationBarTitle("Professions")
        }
     }
 }
```

## 19. Add font to name and hp
```Swift
VStack(alignment: .leading) {
    Text(profession.name)
        .font(.headline)
    Text("HP: d\(profession.hitDie)")
        .font(.caption)
}
```

## 20. Prettify Profession ability
```Swift
static let colors: [String: Color] = ["Strength": .purple,
                                      "Dexterity": .black,
                                      "Charisma": .red,
                                      "Wisdom": .green,
                                      "Intelligence": .pink]
```
```Swift
HStack {
    ...
        
    Spacer()
        
    Text(profession.ability)
        .font(.caption)
        .fontWeight(.black)
        .padding(5)
        .background(Self.colors[profession.ability])
        .cornerRadius(5)
        .foregroundColor(.white)
}
```

## 21. NavigationLink
#### `-> ContentView.swift`
```Swift
ForEach(professionBooks) { book in
    Section(header: Text(book.name)) {
        ForEach(book.professions) { profession in
            NavigationLink(destination: Text(profession.name)) {
                ProfessionRow(profession: profession)
            }
        }
    }
}
```

## 22. Create CharacterDetail
#### `CMD+N -> SwiftUI View -> CharacterDetail.swift`
```Swift
struct CharacterDetail: View {
    let profession: Profession
    
    var body: some View {
        VStack {
            Text("Profession: \(profession.name)")
        }
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(profession: Profession.example)
    }
}
```

## 23. Navigate to CharacterDetail
#### `-> ContentView.swift`
```Swift
NavigationLink(destination: CharacterDetail(profession: profession)) {
    ProfessionRow(profession: profession)
}
```

## 24. State and basic Picker
#### `-> CharacterDetail.swift`
```Swift
static let races = Database.races

@State private var race = 0

var body: some View {
    VStack {
        Text("Profession: \(profession.name)")
        
        Picker("What is your race?", selection: $race) {
            ForEach(0..<Self.races.count, id: \.self) {
                Text(Self.races[$0])
            }
        }
    }
    .navigationBarTitle(Text("Character Details"), displayMode: .inline)
}
```

```Swift
struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetail(profession: Profession.example)
        }
    }
}
```


## 25. Form
```Swift
Form {
    ...
}
```

## 26. Add starting equipment Toggle and Picker
```Swift
static let races = Database.races
static let equipments = ["Sword and Shield", "Staff", "Gold"]
    
@State private var race = 0
@State private var hasStartingEquipment = false
@State private var startingEquipment = 0
```
```Swift
Toggle(isOn: $hasStartingEquipment) {
    Text("Add starting equipment")
}

Picker("What is your starting equipment?", selection: $startingEquipment) {
    ForEach(0..<Self.equipments.count, id: \.self) {
        Text(Self.equipments[$0])
    }
}
.pickerStyle(SegmentedPickerStyle())
```

## 27. Toggle shows equipment
```Swift
if hasStartingEquipment {
    Picker("What is your starting equipment?", selection: $startingEquipment) {
        ForEach(0..<Self.equipments.count, id: \.self) {
            Text(Self.equipments[$0])
        }
    }
    .pickerStyle(SegmentedPickerStyle())
}
```

## 28. Animate toggle
```Swift
Toggle(isOn: $hasStartingEquipment.animation()) {
    Text("Add starting equipment")
}
```

## 29. Level Stepper
```Swift
@State private var level = 1
```
```Swift
Stepper("Level: \(level)", value: $level, in: 1...20)
```

## 30. Name TextField
```Swift
@State private var name = ""
```
```Swift
TextField("Your name", text: $name)
    .disableAutocorrection(true)
```

## 31. Character Image
```Swift
HStack {
    Spacer()
    Image(profession.image)
        .resizable()
        .scaledToFit()
        .frame(height: 300)
    Spacer()
}
```    

## 32. Add Sections and create Button
```Swift
Section {
    ...
}
Section {
    Button("Create your character") {

    }
}
```

## 33. Create Alert
```Swift
@State private var isShowingCharacterAlert = false
```
```Swift
Button("Create your character") {
    
}
.alert(isPresented: $isShowingCharacterAlert) {
    Alert(title: Text("Your character is created"),
            message: Text("\(name), a level \(level) \(Self.races[race]) \(profession.name)"),
            dismissButton: Alert.Button.default(Text("OK")))
}
```

## 34. Present Alert
```Swift
Button("Create your character") {
    self.isShowingCharacterAlert = true
}
```

## 35. Player EnvironmentObject
#### `-> SceneDelegate.swift`
```Swift
let player = Player()

// Create the SwiftUI view that provides the window contents.
let contentView = ContentView()
    .environmentObject(player)
```

## 36. ObjservableObject
#### `-> Player.swift`
```Swift
class Player: ObservableObject {
    @Published var characters: [Character] = []
    ...
}
```

## 37. Add character to Player
#### `-> CharacterDetail.swift`
```Swift
@EnvironmentObject var player: Player
```
```Swift
Button("Create your character") {
    self.isShowingCharacterAlert = true
    let character = Character(profession: self.profession,
                              name: self.name,
                              race: Self.races[self.race],
                              level: self.level,
                              startingEquipment: self.hasStartingEquipment ? Self.equipments[self.startingEquipment] : "")
    self.player.add(character: character)
}
```
```Swift
struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetail(profession: Profession.example)
                .environmentObject(Player.example)
        }
    }
}
```

## 38. CharactersView
#### `COPY CharactersView.swift to project`

## 39. Charcter Identifiable
#### `-> Character.swift`
```Swift
struct Character: Equatable, Identifiable {
```

## 40. TabView
#### `CMD+N -> SwiftUI View -> AppView.swift`
```Swift
struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "person.badge.plus.fill")
                    Text("Create")
                }
            
            CharactersView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Characters")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(Player.example)
    }
}
```

## 41. Start with AppView
#### `-> SceneDelegate.swift`
```Swift
let contentView = AppView()
```

## 42. Delete function
#### `-> CharactersView.swift`
```Swift
func deleteCharacters(at offsets: IndexSet) {
    player.characters.remove(atOffsets: offsets)
}
```

## 43. On Delete
```Swift
ForEach(player.characters) { character in
    ...
}
.onDelete(perform: deleteCharacters)
```

## 44. Edit Button
```Swift
.navigationBarTitle("My Characters")
.navigationBarItems(trailing: EditButton())
```

## 45. Catalyst
`-> Project`
- [x] Mac