import SwiftUI

struct MyMood: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        NavigationLink(destination: MoodPicker(store: _store)) {
            GeometryReader { geometry in
                VStack(spacing: 16) {
                    if let mood = store.dailyMood {
                        Text(mood.emoji)
                            .font(.system(size: 48))
                        
                        Text(mood.id.capitalized)
                            .bold()
                            .foregroundStyle(mood.color)
                            .font(.title)
                        
                        Text("Mood")
                            .foregroundStyle(.white.opacity(0.6))
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(store.dailyMood?.color ?? .yellow)
                        .opacity(0.1)
                )
            }
        }
    }
}

#Preview {
    let store = GetOuthereStore()
    MyMood()
        .environment(store)
}
