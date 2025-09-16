//
//  ContentView.swift
//  onboardingproject
//
//  Created by Mimi Chen on 9/14/25.
//
import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
    @State private var showWelcomeAnimation = false
    @State private var bounceAnimation = false
    
    var body: some View {
        NavigationView {
            WelcomeView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WelcomeView: View {
    @State private var showTitle = false
    @State private var showSubtitle = false
    @State private var showButton = false
    @State private var leafAnimation = false
    @State private var bellAnimation = false
    
    var body: some View {
        ZStack {
            // background gradient
            LinearGradient(
                colors: [
                    Color(red: 0.7, green: 0.9, blue: 1.0),  // Sky blue
                    Color(red: 0.5, green: 0.8, blue: 0.3)   // Grass green
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // floating clouds
            CloudsView()
            
            // main content
            VStack(spacing: 30) {
                Spacer()
                
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color(.white))
                            .opacity(0.5)
                            .frame(width: 120, height: 120)
                            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        
                        Image("mimizook")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                    }
                    .scaleEffect(showTitle ? 1.0 : 0.5)
                    .animation(.spring(response: 0.8, dampingFraction: 0.6), value: showTitle)
                }
                
                // Welcome text
                VStack(spacing: 12) {
                    Text("welcome to")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.1))
                        .opacity(showSubtitle ? 1.0 : 0.0)
                        .offset(y: showSubtitle ? 0 : 20)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.3), value: showSubtitle)
                    
                    Text("cat village")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.1))
                        .multilineTextAlignment(.center)
                        .opacity(showTitle ? 1.0 : 0.0)
                        .offset(y: showTitle ? 0 : 30)
                        .animation(.spring(response: 0.8, dampingFraction: 0.7).delay(0.5), value: showTitle)
                    
                    Text("your new island adventure awaits!")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.2))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .opacity(showSubtitle ? 1.0 : 0.0)
                        .offset(y: showSubtitle ? 0 : 20)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.7), value: showSubtitle)
                }
                
                Spacer()
                
                // Decorative elements
                HStack(spacing: 20) {
                    LeafView()
                        .scaleEffect(leafAnimation ? 1.1 : 0.9)
                        .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: leafAnimation)
                    
                    Image(systemName: "pawprint.fill")
                        .font(.title)
                        .foregroundColor(.brown)
                        .scaleEffect(bellAnimation ? 1.3 : 1.0)
                        .animation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true), value: bellAnimation)
                    
                    LeafView()
                        .scaleEffect(leafAnimation ? 0.9 : 1.1)
                        .animation(.easeInOut(duration: 2.2).repeatForever(autoreverses: true), value: leafAnimation)
                }
                .opacity(showButton ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(1.0), value: showButton)
                
                // Get Started button
                NavigationLink(destination: CharacterSelectionView()) {
                    HStack {
                        Text("get started")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(red: 0.2, green: 0.6, blue: 0.3))
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
                }
                .scaleEffect(showButton ? 1.0 : 0.8)
                .opacity(showButton ? 1.0 : 0.0)
                .animation(.spring(response: 0.8, dampingFraction: 0.6).delay(1.2), value: showButton)
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            withAnimation {
                showTitle = true
                showSubtitle = true
                showButton = true
                leafAnimation = true
                bellAnimation = true
            }
        }
    }
}

struct CloudsView: View {
    @State private var cloudOffset1: CGFloat = -100
    @State private var cloudOffset2: CGFloat = -150
    @State private var cloudOffset3: CGFloat = -200
    
    var body: some View {
        ZStack {
            // Cloud 1
            HStack {
                Spacer()
                CloudShape()
                    .fill(.white.opacity(0.8))
                    .frame(width: 80, height: 40)
                    .offset(x: cloudOffset1)
                    .animation(.linear(duration: 20).repeatForever(autoreverses: false), value: cloudOffset1)
            }
            .offset(y: -200)
            
            // Cloud 2
            HStack {
                CloudShape()
                    .fill(.white.opacity(0.6))
                    .frame(width: 60, height: 30)
                    .offset(x: cloudOffset2)
                    .animation(.linear(duration: 25).repeatForever(autoreverses: false), value: cloudOffset2)
                Spacer()
            }
            .offset(y: -150)
            
            // Cloud 3
            HStack {
                Spacer()
                CloudShape()
                    .fill(.white.opacity(0.7))
                    .frame(width: 70, height: 35)
                    .offset(x: cloudOffset3)
                    .animation(.linear(duration: 18).repeatForever(autoreverses: false), value: cloudOffset3)
            }
            .offset(y: -250)
        }
        .onAppear {
            cloudOffset1 = UIScreen.main.bounds.width + 100
            cloudOffset2 = UIScreen.main.bounds.width + 150
            cloudOffset3 = UIScreen.main.bounds.width + 200
        }
    }
}

struct CloudShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.addEllipse(in: CGRect(x: 0, y: height * 0.3, width: width * 0.6, height: height * 0.7))
        path.addEllipse(in: CGRect(x: width * 0.2, y: 0, width: width * 0.6, height: height * 0.8))
        path.addEllipse(in: CGRect(x: width * 0.4, y: height * 0.2, width: width * 0.6, height: height * 0.8))
        
        return path
    }
}

struct LeafView: View {
    var body: some View {
        Image(systemName: "leaf.fill")
            .font(.title)
            .foregroundColor(Color(red: 0.3, green: 0.7, blue: 0.2))
            .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
    }
}

// Character Selection Page
struct CharacterSelectionView: View {
    @State private var selectedCharacter: Int? = nil
    @Environment(\.presentationMode) var presentationMode
    
    let characters = [
        Character(id: 0, name: "strawberry siamese"),
        Character(id: 1, name: "peach\nragdoll"),
        Character(id: 2, name: "apple\ncalico"),
        Character(id: 3, name: "bluberry shorthair")
    ]
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(red: 0.95, green: 0.98, blue: 1.0),
                    Color(red: 0.9, green: 0.95, blue: 0.9)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Top section with back button
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .fontWeight(.medium)
                            Text("Back")
                                .font(.title3)
                                .fontWeight(.medium)
                        }
                        .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 44)
                .padding(.top, 20)
                
                // Header
                VStack(spacing: 12) {
                    Text("choose your fruit cat")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.1))
                    
                    Text("pick the one that matches you best")
                        .font(.title3)
                        .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.2))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 44)
                
                // Character Selection Grid
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        CharacterCard(
                            character: characters[0],
                            isSelected: selectedCharacter == characters[0].id
                        ) {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                selectedCharacter = characters[0].id
                            }
                        }
                        
                        CharacterCard(
                            character: characters[1],
                            isSelected: selectedCharacter == characters[1].id
                        ) {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                selectedCharacter = characters[1].id
                            }
                        }
                    }
                    
                    HStack(spacing: 12) {
                        CharacterCard(
                            character: characters[2],
                            isSelected: selectedCharacter == characters[2].id
                        ) {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                selectedCharacter = characters[2].id
                            }
                        }
                        
                        CharacterCard(
                            character: characters[3],
                            isSelected: selectedCharacter == characters[3].id
                        ) {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                selectedCharacter = characters[3].id
                            }
                        }
                    }
                }
                .padding(.horizontal, 70)
                
                Spacer()
                
                // Continue Button
                HStack {
                    NavigationLink(destination: OnboardingView()) {
                        HStack {
                            Text("continue adventure")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    selectedCharacter != nil ?
                                    Color(red: 0.2, green: 0.6, blue: 0.3) :
                                    Color.gray.opacity(0.6)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                        )
                    }
                    .disabled(selectedCharacter == nil)
                }
                .padding(.horizontal, 70)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

// Character model
struct Character {
    let id: Int
    let name: String
}

// Character Card Component
struct CharacterCard: View {
    let character: Character
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 15) {
                // Character image - different for each character
                Image(getImageName(for: character.id))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                
                // Character name
                Text(character.name)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.1))
                    .multilineTextAlignment(.center)
            }
            .frame(width: 140, height: 160)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                isSelected ? Color(red: 0.2, green: 0.6, blue: 0.3) : Color.clear,
                                lineWidth: 3
                            )
                    )
            )
        }
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isSelected)
    }
    
    // Helper function to get image name based on character ID
    private func getImageName(for id: Int) -> String {
        switch id {
        case 0: return "strawberry siamese"
        case 1: return "peach ragdoll"
        case 2: return "apple calico"
        case 3: return "blueberry british"
        default: return "strawberry-siamese"
        }
    }
}

// Custom Text Field Style
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            )
            .font(.body)
    }
}

// Character customization page
struct OnboardingView: View {
    @State private var characterName: String = ""
    @State private var selectedTraits: Set<Int> = []
    @Environment(\.presentationMode) var presentationMode
    
    let personalityTraits = [
        PersonalityTrait(id: 0, name: "creative", color: Color(red: 0.9, green: 0.6, blue: 0.8)),
        PersonalityTrait(id: 1, name: "clingy", color: Color(red: 0.6, green: 0.8, blue: 0.9)),
        PersonalityTrait(id: 2, name: "friendly", color: Color(red: 1.0, green: 0.8, blue: 0.6)),
        PersonalityTrait(id: 3, name: "bubbly", color: Color(red: 0.7, green: 0.9, blue: 0.6)),
        PersonalityTrait(id: 4, name: "sneaky", color: Color(red: 0.8, green: 0.7, blue: 0.9)),
        PersonalityTrait(id: 5, name: "silly", color: Color(red: 1.0, green: 0.7, blue: 0.7)),
        PersonalityTrait(id: 6, name: "curious", color: Color(red: 0.6, green: 0.9, blue: 0.8)),
        PersonalityTrait(id: 7, name: "peaceful", color: Color(red: 0.8, green: 0.9, blue: 0.7)),
        PersonalityTrait(id: 8, name: "social", color: Color(red: 0.9, green: 0.8, blue: 0.6)),
        PersonalityTrait(id: 9, name: "cuddly", color: Color(red: 0.7, green: 0.8, blue: 1.0)),
        PersonalityTrait(id: 10, name: "empath", color: Color(red: 0.9, green: 0.7, blue: 0.8)),
        PersonalityTrait(id: 11, name: "sleepy", color: Color(red: 0.8, green: 0.8, blue: 0.9))
    ]
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(red: 0.95, green: 0.98, blue: 1.0),
                    Color(red: 0.9, green: 0.95, blue: 0.9)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    // Top section with back button
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                Text("Back")
                                    .font(.title3)
                                    .fontWeight(.medium)
                            }
                            .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 44)
                    .padding(.top, 20)
                    
                    // Header
                    VStack(spacing: 12) {
                        Text("customize your cat")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.1))
                            .multilineTextAlignment(.center)
                        
                        Text("give your cat a name and pick 3 personality traits")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.2))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 44)
                    }
                    
                    // Character Name Input
                    VStack(alignment: .leading, spacing: 8) {
                        Text("cat name")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.1))
                        
                        TextField("enter character name", text: $characterName)
                            .textFieldStyle(CustomTextFieldStyle())
                            .autocapitalization(.words)
                    }
                    .padding(.horizontal, 44)
                    
                    // Personality Traits Selection
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(spacing: 4) {
                            Text("personality traits")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.1))
                            
                            Text("select 3 traits (\(selectedTraits.count)/3)")
                                .font(.subheadline)
                                .foregroundColor(Color(red: 0.5, green: 0.4, blue: 0.3))
                        }
                        .padding(.horizontal, 44)
                        
                        // Trait chips in flexible grid
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 2),
                            GridItem(.flexible(), spacing: 2),
                            GridItem(.flexible(), spacing: 2)
                        ], spacing: 8) {
                            ForEach(personalityTraits, id: \.id) { trait in
                                TraitChip(
                                    trait: trait,
                                    isSelected: selectedTraits.contains(trait.id),
                                    isDisabled: !selectedTraits.contains(trait.id) && selectedTraits.count >= 3
                                ) {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                        if selectedTraits.contains(trait.id) {
                                            selectedTraits.remove(trait.id)
                                        } else if selectedTraits.count < 3 {
                                            selectedTraits.insert(trait.id)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 44)
                        Spacer()
                    }
                    
                    // Continue Button
                    NavigationLink(destination: FinalView()) {
                        HStack {
                            Text("complete setup")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    canContinue ?
                                    Color(red: 0.2, green: 0.6, blue: 0.3) :
                                    Color.gray.opacity(0.6)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                        )
                    }
                    .disabled(!canContinue)
                    
                    Spacer(minLength: 40)
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    private var canContinue: Bool {
        !characterName.isEmpty && selectedTraits.count == 3
    }
}

// Personality Trait model
struct PersonalityTrait {
    let id: Int
    let name: String
    let color: Color
}

// Trait Chip Component
struct TraitChip: View {
    let trait: PersonalityTrait
    let isSelected: Bool
    let isDisabled: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Text(trait.name)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(
                    isSelected ? .white :
                    isDisabled ? .gray :
                    Color(red: 0.3, green: 0.2, blue: 0.1)
                )
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            isSelected ? trait.color :
                            isDisabled ? Color.gray.opacity(0.3) :
                            Color.white
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(
                                    isSelected ? trait.color :
                                    isDisabled ? Color.gray.opacity(0.5) :
                                    trait.color.opacity(0.6),
                                    lineWidth: 2
                                )
                        )
                        .shadow(
                            color: isSelected ? trait.color.opacity(0.3) : .black.opacity(0.1),
                            radius: isSelected ? 6 : 4,
                            x: 0,
                            y: isSelected ? 4 : 2
                        )
                )
        }
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .opacity(isDisabled ? 0.6 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
        .disabled(isDisabled)
    }
}

// Final page - Profile Summary and Account Creation
struct FinalView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(red: 0.95, green: 0.98, blue: 1.0),
                    Color(red: 0.9, green: 0.95, blue: 0.9)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    // Top section with back button
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                Text("Back")
                                    .font(.title3)
                                    .fontWeight(.medium)
                            }
                            .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 44)
                    .padding(.top, 20)
                    
                    // Header
                    VStack(spacing: 12) {
                        Text("your new island adventure awaits!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.1))
                            .multilineTextAlignment(.center)
                        Text("create your account")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.4, green: 0.3, blue: 0.2))
                            .multilineTextAlignment(.center)
                    }.padding(.horizontal, 44)
                    
                    
                    // Account Creation Section
                        VStack(spacing: 24) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("username")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.1))
                                
                                TextField("enter username", text: $username)
                                    .textFieldStyle(CustomTextFieldStyle())
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("password")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.3, green: 0.2, blue: 0.1))
                                
                                SecureField("enter password", text: $password)
                                    .textFieldStyle(CustomTextFieldStyle())
                            }
                        }
                    .padding(.horizontal, 44)
                    
                    // Join Village Button
                    Button(action: {
                        // Handle join village action
                        print("Joining the village!")
                    }) {
                        HStack {
                            Text("join the village")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Image(systemName: "house.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    canJoinVillage ?
                                    Color(red: 0.2, green: 0.6, blue: 0.3) :
                                    Color.gray.opacity(0.6)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                        )
                    }
                    .disabled(!canJoinVillage)
                    
                    Spacer(minLength: 40)
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    private var canJoinVillage: Bool {
        !username.isEmpty && !password.isEmpty
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
