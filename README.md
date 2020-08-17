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

## JetNavigationExternalController   

Allows you to control navigation outside of the JetNavigationView

```swift
class ExternalController: JetNavigationExternalController, ObservableObject {
    var jetNavigationController: AnyObject?
}

struct RootView: View {
    
    @StateObject
    var externalController:
        ExternalController = .init()
    
    var body: some View {
        VStack{
            JetNavigationView(externalController: externalController) {
                FirstExample()
            }
            
            //External button for control
            Button {
                self.externalController.home()
            } label: {
                Text("Go to home")
            }

        }
    }
}
```

![RecordScreen-2](https://github.com/cbepxbeo/jet-navigation/blob/main/Media/Gif/screen-2.gif)   