import SwiftUI
import UIKit

// MARK: - Color Palette
extension Color {
    // Primary brand colors (bright, playful)
    static let pokePrimary = Color(red: 0.13, green: 0.62, blue: 0.99)     // Sky blue
    static let pokeSecondary = Color(red: 0.00, green: 0.76, blue: 0.53)   // Mint green
    static let pokeAccent = Color(red: 1.00, green: 0.75, blue: 0.20)      // Sunny yellow

    // Surfaces
    static let pokeCard = Color(red: 0.98, green: 0.99, blue: 1.00)        // Soft white-blue card
    static let pokeSurface = Color.white

    // Text
    static let pokeText = Color(red: 0.12, green: 0.18, blue: 0.25)        // Deep ink
    static let pokeSubtext = Color(red: 0.37, green: 0.44, blue: 0.53)     // Muted

    // Shadows/Outlines
    static let pokeShadow = Color.black

    // Background gradient
    static let pokeBackgroundTop = Color(red: 0.94, green: 0.98, blue: 1.00)
    static let pokeBackgroundBottom = Color(red: 0.87, green: 0.96, blue: 0.92)
}

// MARK: - Fonts
extension Font {
    static let cartoonLargeTitle: Font = .system(.largeTitle, design: .rounded).weight(.heavy)
    static let cartoonTitle: Font = .system(.title2, design: .rounded).weight(.bold)
    static let cartoonBody: Font = .system(.body, design: .rounded).weight(.semibold)
    static let cartoonCaption: Font = .system(.caption, design: .rounded).weight(.semibold)
}

// MARK: - View Modifiers
struct CartoonCardModifier: ViewModifier {
    var cornerRadius: CGFloat = 16
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color.pokeCard)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(Color.black.opacity(0.06), lineWidth: 1)
            )
            .shadow(color: Color.pokeShadow.opacity(0.08), radius: 12, x: 0, y: 6)
    }
}

extension View {
    func cartoonCard(cornerRadius: CGFloat = 16) -> some View {
        modifier(CartoonCardModifier(cornerRadius: cornerRadius))
    }
}

// MARK: - Badge
struct CartoonBadge: View {
    var text: String
    var gradient: LinearGradient = LinearGradient(
        colors: [.pokeAccent, .pokeSecondary],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        Text(text)
            .font(.cartoonCaption)
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(gradient)
            )
            .shadow(color: .pokeShadow.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}

// MARK: - Button Style
struct CartoonButtonStyle: ButtonStyle {
    var fill: Color = .pokePrimary

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.cartoonBody)
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(fill)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(Color.white.opacity(0.25), lineWidth: 1)
            )
            .shadow(color: .pokeShadow.opacity(configuration.isPressed ? 0.05 : 0.15), radius: configuration.isPressed ? 4 : 10, x: 0, y: configuration.isPressed ? 2 : 6)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

// MARK: - Navigation Bar Appearance (UIKit bridge)
struct NavBarStyle {
    static func applyCartoonAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(
            red: 0.94, green: 0.98, blue: 1.00, alpha: 1.0
        )
        // Large title with rounded/heavy look
        let titleAttrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(Color.pokeText),
            .font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        let largeTitleAttrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(Color.pokeText),
            .font: UIFont.systemFont(ofSize: 34, weight: .heavy)
        ]
        appearance.titleTextAttributes = titleAttrs
        appearance.largeTitleTextAttributes = largeTitleAttrs

        appearance.shadowColor = UIColor.black.withAlphaComponent(0.06)

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor(Color.pokePrimary)
    }
}

