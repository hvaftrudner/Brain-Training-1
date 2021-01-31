//
//  ContentView.swift
//  rockPaperScissors
//
//  Created by Kristoffer Eriksson on 2021-01-31.
//

import SwiftUI

struct Choice: View {
    let choice : String
    
    var body: some View{
        
            Text(choice)
                .frame(width: 100, height: 40)
                .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .foregroundColor(.white)
                .clipShape(Capsule())
            
        
    }
}

struct ContentView: View {
    
    let choices = ["Rock", "Paper", "Scissors"]
    @State private var playCount = 0
    
    @State private var compChoice = ""
    @State private var winOrLose = false
    @State private var gameover = false
    
    @State private var playerScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .yellow, .orange]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
            
                Text("Score: \(playerScore)")
                    .frame(width: 300, height: 100)
                    .font(.largeTitle)
                    .background(LinearGradient(gradient: Gradient(colors: [.black, .purple]), startPoint: .top, endPoint: .bottom))
                    .foregroundColor(Color.white)
                
                Text(winOrLose ? "Win against" : "Loose against")
                
                Text(compChoice)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    
                Text("Choose the winner...")
                
                HStack{
                    ForEach(0 ..< 3){ number in
                        Button(action: {
                            self.buttonClick(self.choices[number])
                            self.playCount += 1
                        }) {
                            Choice(choice: self.choices[number])
                        }
                    }
                }
                
                Button(action: {
                    self.startGame()
                }) {
                    Text("START")
                }
                
                Spacer()
            }
            .alert(isPresented: $gameover) {
                Alert(title: Text("Game Over"), message: Text("your score is: \(playerScore)"), dismissButton: .default(Text("ok")))
            }
        }
    }
    
    func startGame(){
        compChoice = choices.randomElement() ?? ""
        winOrLose = Bool.random()
    }
    
    func buttonClick(_ answer: String){
        
        if winOrLose == true {
            switch answer {
            case "Scissors":
                switch compChoice {
                case "Rock":
                    playerScore -= 1
                    print("lost")
                case "Paper":
                    playerScore += 1
                    print("win")
                default:
                    print("draw")
                }
            case "Rock":
                switch compChoice {
                case "Paper":
                    playerScore -= 1
                    print("lost")
                case "Scissors":
                    playerScore += 1
                    print("win")
                default:
                    print("draw")
                }
            case "Paper":
                switch compChoice {
                case "Scissors":
                    playerScore -= 1
                    print("lost")
                case "Rock":
                    playerScore += 1
                    print("win")
                default:
                    print("draw")
                }
            default:
                print("nothing here")
            }
            
            
        } else {
            switch answer {
            case "Scissors":
                switch compChoice {
                case "Paper":
                    playerScore -= 1
                    print("lost")
                case "Rock":
                    playerScore += 1
                    print("win")
                default:
                    print("draw")
                }
            case "Rock":
                switch compChoice {
                case "Scissors":
                    playerScore -= 1
                    print("lost")
                case "Paper":
                    playerScore += 1
                    print("win")
                default:
                    print("draw")
                }
            case "Paper":
                switch compChoice {
                case "Rock":
                    playerScore -= 1
                    print("lost")
                case "Scissors":
                    playerScore += 1
                    print("win")
                default:
                    print("draw")
                }
            default:
                print("nothing here")
            }
            
            
        }
        if playCount >= 10 {
            self.gameover = true
        }
        self.startGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
