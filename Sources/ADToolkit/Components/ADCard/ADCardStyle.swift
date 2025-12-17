//
//  SwiftUIView.swift
//  ADToolkit
//
//  Created by Alper Dal on 17.12.25.
//

import SwiftUI

// MARK: - CardStyle

/// A type that defines the visual appearance of a `Card`.
///
/// Use `CardStyle` to control layout, typography, background,
/// and shadow properties of a card.
/// - Parameters:
///   - titleColor: The color of the title text.
///   - titleFont: The font used for the title.
///   - titleFontWeight: The weight applied to the title font.
///   - titleFontDesign: The design of the title font.
///   - titleAlignment: The alignment of the title within the card.
///   - verticalSpacing: The spacing between vertical elements.
///   - cardPadding: The padding around the card content.
///   - contentHorizontalPadding: The horizontal padding for the content.
///   - dividerPadding: The padding applied to the divider below the title.
///   - background: The background style of the card.
///   - cornerRadius: The corner radius of the card.
///   - shadowColor: The color of the shadow.
///   - shadowRadius: The blur radius of the shadow.
@MainActor
public struct ADCardStyle: Sendable {
    public var titleColor: Color
    public var titleFont: Font
    public var titleFontWeight: Font.Weight
    public var titleFontDesign: Font.Design
    public var titleAlignment: Alignment

    // Layout
    public var verticalSpacing: CGFloat
    public var cardPadding: CGFloat
    public var contentHorizontalPadding: CGFloat
    public var dividerPadding: EdgeInsets

    // Background
    public var background: AnyShapeStyle
    public var cornerRadius: CGFloat

    // Shadow
    public var shadowColor: Color
    public var shadowRadius: CGFloat

    public init(
        titleColor: Color,
        titleFont: Font,
        titleFontWeight: Font.Weight,
        titleFontDesign: Font.Design,
        titleAlignment: Alignment,
        verticalSpacing: CGFloat,
        cardPadding: CGFloat,
        contentHorizontalPadding: CGFloat,
        dividerPadding: EdgeInsets,
        background: AnyShapeStyle,
        cornerRadius: CGFloat,
        shadowColor: Color,
        shadowRadius: CGFloat
    ) {
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.titleFontWeight = titleFontWeight
        self.titleFontDesign = titleFontDesign
        self.titleAlignment = titleAlignment
        self.verticalSpacing = verticalSpacing
        self.cardPadding = cardPadding
        self.contentHorizontalPadding = contentHorizontalPadding
        self.dividerPadding = dividerPadding
        self.background = background
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
    }
}

// MARK: - Presets

public extension ADCardStyle {

    static let `default` = ADCardStyle(
        titleColor: .primary,
        titleFont: .callout,
        titleFontWeight: .semibold,
        titleFontDesign: .default,
        titleAlignment: .leading,
        verticalSpacing: 6,
        cardPadding: 12,
        contentHorizontalPadding: 6,
        dividerPadding: EdgeInsets(top: 4, leading: 0, bottom: 8, trailing: 0),
        background: AnyShapeStyle(.ultraThinMaterial),
        cornerRadius: 28,
        shadowColor: .black.opacity(0.12),
        shadowRadius: 2
    )

    static let compact = ADCardStyle(
        titleColor: .secondary,
        titleFont: .footnote,
        titleFontWeight: .medium,
        titleFontDesign: .rounded,
        titleAlignment: .leading,
        verticalSpacing: 4,
        cardPadding: 8,
        contentHorizontalPadding: 4,
        dividerPadding: EdgeInsets(top: 2, leading: 0, bottom: 4, trailing: 0),
        background: AnyShapeStyle(.thinMaterial),
        cornerRadius: 18,
        shadowColor: .black.opacity(0.08),
        shadowRadius: 1
    )
}
