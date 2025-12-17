# ADToolkit

A modular Swift package that provides a growing collection of **reusable UI components,
helpers, and utility building blocks** for Swift and SwiftUI.

ADToolkit is designed as a flexible toolbox rather than a single-purpose library.
It currently focuses on **clean, configurable UI elements**, but will gradually expand
to include **layout helpers, small logic utilities, experimental components, and
quality-of-life abstractions**.

The goal is to offer **well-crafted, lightweight building blocks** that can be easily
integrated into real-world projects without unnecessary dependencies.


## ✨ Features

- 🧱 Reusable UI components for SwiftUI
- 🎨 Fully configurable and style-driven APIs
- 🌈 Built-in presets for quick integration
- 🛠 Small helpers and utility abstractions
- 🔄 Designed to grow over time with new components
- 📱 Works across all SwiftUI platforms


## 🛠️ Requirements

- iOS 17.0 or later
- macOS 14.0 or later
- watchOS 10.0 or later
- Xcode 15 or later
- Swift 5.9 or later

## 📦 Installation (Swift Package Manager)

In Xcode:\
**File → Add Packages →** enter the repository URL:

    https://github.com/CodeByAlper/ADToolkit

## 🚀 Usage

### Card

``` swift
import ADToolkit

struct ContentView: View {
    var body: some View {
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
}
```

## 🤝 Contribution

Contributions are welcome! 
1. Open an Issue\
2. Create a Pull Request\
3. Use clear and meaningful commit messages\
4. Keep PRs focused and concise

## 📄 License

MIT License -- free for personal and commercial projects.
