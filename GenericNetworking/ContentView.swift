//
//  ContentView.swift
//  GenericNetworking
//
//  Created by Dishant Nagpal on 04/06/23.
//

import SwiftUI
import SwiftyCall

struct ContentView: View {
    @State var question:String?
    @State var punchline:String?
    var body: some View {
        VStack {
            Spacer()
            if let question = question {
                Text(question)
                    .bold()
                    .font(.system(size: 20))
                    .padding(.top)
            }
            
            if let punchline = punchline {
                Text(punchline)
                    .font(.system(size: 17,weight: .semibold))
                    .foregroundColor(.secondary)
                    .padding()
                
            }
            
            Spacer()
            Button {
                getDevJoke()
            } label: {
                Text("More!")
                    .padding()
                    .padding([.trailing,.leading],15)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                //.frame(maxWidth: 75,maxHeight:55)
                    .padding(.bottom)
            }.padding()
            
        }
        .padding(.top)
        .padding()
        .onAppear{
            getDevJoke()
        }
    }
    
    func getDevJoke(){
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
