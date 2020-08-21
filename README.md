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
- `buttonName` + `style` + `option` + `tag`   
- `buttonName` + `style` + `tag`   
- `action` + `option` + `label`   
- `tag` + `option` + `label`   
- `tag` + `label`   
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
