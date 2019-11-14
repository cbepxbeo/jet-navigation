# JetNavigation

An alternative SwiftUI NavigationView.

```swift
import JetNavigation

struct RootView: View {
    var body: some View {
        JetNavigationView {
            FirstExample()
        }
    }
}

struct FirstExample: View {
    var body: some View {
        ZStack {
            Color.green
            JetNavigationLink(destination: SecondExample()) {
                Text("Go to Second")
            }
        }
    }
}

struct SecondExample: View {
    var body: some View {
        ZStack {
            Color.red
            JetNavigationLink(action: .back) {
                Text("Back")
            }
        }
    }
}
```
![RecordScreen-1](https://github.com/cbepxbeo/jet-navigation/blob/main/Media/Gif/screen-1.gif)