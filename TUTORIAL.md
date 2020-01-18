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
    Text("Hit Die: d\(profession.hitDie)")
    Text(profession.ability)
}
```

## 15. Resize Image
```Swift
Image(profession.icon)
    .resizable()
    .scaledToFit()
    .frame(height: 40)
```

## 16. VStack
```Swift
HStack {
    Image(profession.icon)
    VStack {
        Text(profession.name)
        Text("Hit Die: d\(profession.hitDie)")
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

## 19. Add font to name
```Swift
VStack(alignment: .leading) {
    Text(profession.name)
        .font(.headline)
    Text("Hit Die: d\(profession.hitDie)")
}
```
## 20. Prettify image
```Swift
Image(profession.icon)
    ...
    .cornerRadius(5)
    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.yellow, lineWidth: 2))
```
## 21. Add font name to hit die
```Swift
Text("Hit Die: d\(profession.hitDie)")
    .font(.caption)
```
## 22. Prettify Profession ability
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

## 23. NavigationLink
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

## 24. Create ProfessionDetail
#### `CMD+N -> SwiftUI View -> ProfessionDetail.swift`
```Swift
let profession: Profession

var body: some View {
    VStack {
        Image(profession.image)
        Text(profession.description)
    }
    .navigationBarTitle(profession.name)
}
```

```Swift
struct ProfessionDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfessionDetail(profession: Profession.example)
        }
    }
}
```

## 25. Inline navigation bar
```Swift
.navigationBarTitle(Text(profession.name), displayMode: .inline)
```

## 26. Fix image size and alignments
```Swift
VStack {
    Image(profession.image)
        .resizable()
        .scaledToFit()
        .frame(height: 500)
        .padding()

    Text(profession.description)
        .padding()

    Spacer()
}
```

## 27. Navigate to ProfessionDetail
#### `-> ContentView.swift`
```Swift
NavigationLink(destination: ProfessionDetail(profession: profession)) {
    ProfessionRow(profession: profession)
}
```

## 28. Fix short text (paladin) description alignment
#### `-> ProfessionDetail.swift`
```Swift
HStack {
    Text(profession.description)
        .padding()
    Spacer(minLength: 0)
}
```

## 29. ScrollView
```Swift
ScrollView {
    ...
}
```

## 30. ZStack
```Swift
ZStack(alignment: .topTrailing) {
    Image(profession.image)
        .resizable()
        .scaledToFit()
        .frame(maxWidth: .infinity, minHeight: 500, maxHeight: 500)
        .padding()
    Image(profession.icon)
        .resizable()
        .scaledToFit()
        .frame(height: 60)
        .cornerRadius(5)
        .padding()
}
```

## 31. Choose this profession button
```Swift
VStack {
    ...

    NavigationLink("Choose this profession", destination: Text(profession.name))

    Spacer()
}
```

## 32. Create CharacterDetail
#### `CMD+N -> SwiftUI View -> CharacterDetail.swift`
```Swift
struct CharacterForm: View {
    let profession: Profession
    
    var body: some View {
        VStack {
            Text("Profession: \(profession.name)")
        }
    }
}

struct CharacterForm_Previews: PreviewProvider {
    static var previews: some View {
        CharacterForm(profession: Profession.example)
    }
}
```

## 33. Navigate to CharacterDetail
#### `-> ProfessionDetail.swift`
```Swift
NavigationLink("Choose this profession", destination: Text(profession.name))
```

## 34. State and basic Picker
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
struct CharacterForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetail(profession: Profession.example)
        }
    }
}
```


## 35. Form
```Swift
Form {
    ...
}
```

## 36. Add starting equipment Toggle and Picker
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

## 37. Toggle shows equipment
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

## 38. Animate toggle
```Swift
Toggle(isOn: $hasStartingEquipment.animation()) {
    Text("Add starting equipment")
}
```

## 39. Level Stepper
```Swift
@State private var level = 1
```
```Swift
Stepper("Level: \(level)", value: $level, in: 1...20)
```

## 40. Name TextField
```Swift
@State private var name = ""
```
```Swift
TextField("Your name", text: $name)
```

## 41. Add Sections and create Button
```Swift
Section {
    ...
}
Section {
    Button("Create your character") {

    }
}
```

## 42. Create Alert
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

## 43. Present Alert
```Swift
Button("Create your character") {
    self.isShowingCharacterAlert = true
}
```

## 44. Player EnvironmentObject
#### `-> SceneDelegate.swift`
```Swift
let player = Player()

// Create the SwiftUI view that provides the window contents.
let contentView = ContentView()
    .environmentObject(player)
```

## 45. ObjservableObject
#### `-> Player.swift`
```Swift
class Player: ObservableObject {
    @Published var characters: [Character] = []
    ...
}
```

## 46. Add character to Player
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

## 47. CharactersView
#### `CMD+N -> SwiftUI View -> CharactersView.swift`
```Swift
struct CharactersView: View {
    @EnvironmentObject var player: Player
    
    var body: some View {
        NavigationView {
            List {
                ForEach(player.characters) { character in
                    HStack {
                        Image(character.profession.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.yellow, lineWidth: 2))
                        Text("\(character.name), a level \(character.level) \(character.race) \(character.profession.name)")
                    }   
                }
            }
            .navigationBarTitle("My Characters")
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var player = Player.example
    
    static var previews: some View {
        CharactersView()
            .environmentObject(player)
    }
}

```

## 48. Charcter Identifiable
#### `-> Character.swift`
```Swift
struct Character: Equatable, Identifiable {
```

## 49. TabView
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
    static let player = Player.example
    
    static var previews: some View {
        AppView()
            .environmentObject(player)
    }
}
```

## 50. Start with AppView
#### `-> SceneDelegate.swift`
```Swift
let contentView = AppView()
```

## 51. Delete function
#### `-> CharactersView.swift`
```Swift
func deleteCharacters(at offsets: IndexSet) {
    player.characters.remove(atOffsets: offsets)
}
```

## 52. On Delete
```Swift
ForEach(player.characters) { character in
    ...
}
.onDelete(perform: deleteCharacters)
```

## 53. Edit Button
```Swift
.navigationBarTitle("My Characters")
.navigationBarItems(trailing: EditButton())
```

## 54. Fix navigation bar top
#### `-> AppView.swift`
```Swift
TabView {
    ...
}
.edgesIgnoringSafeArea(.top)
```

## 55. Catalyst
`-> Project`
- [x] Mac