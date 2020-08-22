# JetNavigation

An alternative SwiftUI NavigationView.

# JetNavigationView


```swift
import JetNavigation

struct RootView: View {
    var body: some View {
        JetNavigationView {
            ExampleView()
        }
    }
}

```
![RecordScreen-1](https://github.com/cbepxbeo/jet-navigation/blob/main/Media/Gif/screen-1.gif)

# JetNavigationLink

JetNavigationLink allows you to navigate between views and is a universal means of interacting with navigation. When creating a JetNavigationLink, you can specify a navigation option (forward/backward/no animation/transparency), a view to navigate to, or an action (backward or root view). When you specify a view to navigate to, it is possible to specify a tag and subsequently navigate to it. Each of these options allows you to use either a label or a button style.   

## Parameters:    

- `destination` - the view to navigate   
- `tag` - unique tag of the view that is being navigated to   
- `toTag` - the view tag to navigate   
- `option` - transition option (animation)   
- `action` - go back either to the root view   
- `style` - button style   
- `label` - button design for the transition   
- `nameButton` - the name of the button (when using a style)   

## Possible Options for Combining Parameters:   

- `destination` + `label`   
- `destination` + `tag` + `label`   
- `destination` + `option` + `label`   
- `destination` + `tag` + `option` + `label`   
- `buttonName` + `style` + `option` + `destination`   
- `buttonName` + `style` + `destination`    
- `buttonName` + `style` + `option` + `action`   
- `buttonName` + `style` + `action`   
- `buttonName` + `style` + `option` + `toTag`   
- `buttonName` + `style` + `tag`   
- `action` + `option` + `label`   
- `toTag` + `option` + `label`   
- `toTag` + `label`   
- `option` + `label`   

# JetNavigationExternalController   

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
