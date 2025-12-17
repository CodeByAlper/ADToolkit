//
//  ADCard.swift
//  ADToolkit
//
//  Created by Alper D on 04.08.25.
//

import SwiftUI

/// A reusable container view that presents content inside a styled card.
///
/// `Card` can optionally display a title above its content and is fully
/// customizable using a `CardStyle`.
///
/// - Parameters:
///   - title: An optional text shown at the top of the card.
///   - style: The visual style applied to the card.
///            Use `.default` or provide a custom `CardStyle`.
///   - content: A view builder that creates the card’s content.
public struct ADCard<Content: View>: View {
    private var title: String? = nil
    private let style: ADCardStyle
    private let content: Content
   
    public init(
        title: String? = nil,
        style: ADCardStyle = .default,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.style = style
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: style.verticalSpacing) {
            if let title {
                titleView(title)
                Divider()
                    .padding(style.dividerPadding)
            }

            content
                .padding(.horizontal, style.contentHorizontalPadding)
        }
        .padding(style.cardPadding)
        .frame(maxWidth: .infinity)
        .background(
            style.background,
            in: RoundedRectangle(
                cornerRadius: style.cornerRadius,
                style: .continuous
            )
        )
        .shadow(
            color: style.shadowColor,
            radius: style.shadowRadius
        )
        .accessibilityElement(children: .contain)
    }
    
    @ViewBuilder
    private func titleView(_ title: String) -> some View {
        Text(title)
            .font(style.titleFont)
            .fontWeight(style.titleFontWeight)
            .fontDesign(style.titleFontDesign)
            .foregroundStyle(style.titleColor)
            .frame(maxWidth: .infinity, alignment: style.titleAlignment)
            .accessibilityAddTraits(.isHeader)
    }
}

#Preview("Card Styles") {
    VStack(spacing: 16) {

        ADCard(title: "Default Card") {
            Text("Hello World")
        }

        ADCard(title: "Compact Card", style: .compact) {
            Text("More compact content")
        }

        ADCard {
            Text("Card without title")
        }
    }
    .padding()
}
