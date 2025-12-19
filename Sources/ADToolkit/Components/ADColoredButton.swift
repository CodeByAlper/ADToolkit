//
//  ADColoredButton.swift
//  ADToolkit
//
//  Created by CodeByAlper on 08.12.25.
//

import SwiftUI

/// A customizable button with a colored border and optional subtitle.
///
/// `ADColoredButton` is designed for compact, tappable actions that need
/// a visual emphasis through color. It supports Dynamic Type, accessibility,
/// and flexible layout constraints.
///
/// The button displays a title and, optionally, a subtitle stacked vertically.
public struct ADColoredButton: View {
    let title: String
    let titleFont: Font
    let subtitle: String?
    let subtitleFont: Font
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let minHeight: CGFloat
    let action: () -> Void
    
    /// Creates a colored button with a title and optional subtitle.
      ///
      /// - Parameters:
      ///   - title: The main text displayed in the button.
      ///   - subtitle: An optional secondary text displayed below the title.
      ///   - titleFont: The font used for the title text. Defaults to `.caption`.
      ///   - subtitleFont: The font used for the subtitle text. Defaults to `.caption2.bold()`.
      ///   - backgroundColor: The color used for the border and background tint.
      ///   - cornerRadius: The corner radius of the button. Defaults to `18`.
      ///   - borderWidth: The width of the button’s border. Defaults to `1.5`.
      ///   - minHeight: The minimum height of the button’s content area. Defaults to `54`.
      ///   - action: The action to perform when the button is tapped.
    public init(
        title: String,
        subtitle: String? = nil,
        titleFont: Font = .caption,
        subtitleFont: Font = .caption2.bold(),
        backgroundColor: Color = .gray,
        cornerRadius: CGFloat = 18,
        borderWidth: CGFloat = 1.5,
        minHeight: CGFloat = 54,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.subtitle = subtitle
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.minHeight = minHeight
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                makeTitleView()
                
                if let subtitle {
                    makeSubtitleView(subtitle)
                }
            }
            .frame(minHeight: minHeight)
            .padding(.vertical, 6)
            .background(backgroundColor.opacity(0.2))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(backgroundColor, lineWidth: borderWidth)
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
            )
        }
        .buttonStyle(.plain)
        .dynamicTypeSize(.xxxLarge ... .accessibility5)
        .accessibilityLabel(Text("\(title) \(subtitle ?? "")"))
    }
    
    // MARK: - Subviews
    
    private func makeTitleView() -> some View {
        Text(title)
            .font(titleFont)
            .minimumScaleFactor(0.5)
            .allowsTightening(true)
            .foregroundColor(.primary)
            .frame(minHeight: 18)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private func makeSubtitleView(_ subtitle: String) -> some View {
        Text(subtitle)
            .font(subtitleFont)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .allowsTightening(true)
            .foregroundColor(.primary)
            .frame(minHeight: 14)
    }
}

#if DEBUG && !os(watchOS)
#Preview {
    Text("ADColoredButton")
        .font(.largeTitle.monospaced())
    
    ScrollView {
        ADColoredButton(
            title: "Cola (Süßstoff)",
            subtitle: "+ 150ml",
            backgroundColor: .red
        )
            .frame(width: 250)
        
        ADColoredButton(
            title: "XS",
            subtitle: "+ 150ml",
            backgroundColor: .yellow
        )
            .frame(width: 200)
        
        ADColoredButton(
            title: String(localized: .init("Custom")),
            backgroundColor: .green
        )
            .frame(width: 150)
    }
}
#endif
