# SwiftyCall-Example
An app to demonstrate how [`SwiftyCall`](https://github.com/Dishant10/SwiftyCall) works. [`SwifyCall`](https://github.com/Dishant10/SwiftyCall) is designed to help developers with their networking sessions.

## Installation
Clone this repo and open using Xcode. Build and run on any iOS/iPad simulator. The code for this project holds the atmost importance.

## Usage 

The app shows dev jokes from Jokes API https://backend-omega-seven.vercel.app/api/getjoke to fetch new jokes. The app also has a more button which fetches a new joke everytime pressed.
The code of this project demonstrates the ease of networking and API calling SwiftyCall. 
The user needs to provide the API link and the type of JSON expected.

## Code 

```swift
NetworkingManager.shared.fetch("https://backend-omega-seven.vercel.app/api/getjoke", type: [Joke].self) { res in
            switch res {
            case .success(let data):
                //                    print(data[0].question)
                //                    print(data[0].punchline)
                self.question = data[0].question
                self.punchline = data[0].punchline
            case .failure(let error):
                print(error)
            }
        }
      
```

You need to install SwiftyCall as a package/Dependency using the Swift Package Manager from the [`Package Link`](https://github.com/Dishant10/SwiftyCall.git)
After successfully installing the package using SPM, simply import it in your swift file like any other package or first party framework.

```swift
import SwiftUI
import SwiftyCall
```

## Video Demo



![ezgif com-video-to-gif](https://github.com/Dishant10/SwiftyCall/assets/84343829/9838a80b-af38-4701-8d65-c80b72baacce)



</br>

![ezgif com-video-to-gif-2](https://github.com/Dishant10/SwiftyCall/assets/84343829/3061b530-75fa-480c-9d16-cdac0a737990)
