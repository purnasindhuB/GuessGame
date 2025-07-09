//
//  ContentView.swift
//  GuessGame
//


import SwiftUI

struct ContentView: View {
    @State var correctAnswer = 0
    @State var score = 0
    @State var gameTitle = "?"
    @State var gameSubtitle = ""
    
    var body: some View {
        VStack {
            VStack {
                Text(gameTitle)
                    .font(.system(size: 40,weight: .semibold))
                    .padding(.top,100)
                Text(gameSubtitle)
                    .font(.system(size: 20,weight: .semibold))
                    .padding(.top,100)
            }
            HStack {
                Spacer()//topRHS downLHS
                Text("Score \(score)")
                    .font(.system(size: 15,weight:.semibold))
            }
            Button(action: {
                check(answer: 0)
            }, label: {
                Image("dog")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Button(action: {
                check(answer: 1)
            }, label: {
                Image("cat")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 6))            })
            Button(action: {
                check(answer: 2)
            }, label: {
                Image("fox")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 6))            })
            Spacer()//down content up vice versa
        }
        .padding()
    }
    
    func check(answer:Int){
        if answer == correctAnswer {
            score += 1
            gameTitle = "Success!"
            getResult(answer: answer,isCorrect: true)
        }
        else {
            if score != 0 {
                score -= 1
                gameTitle = "Failed!"
                getResult(answer: answer,isCorrect: false)
            }
        }
        randomizeCorrectAnswer()
    }
    
    func randomizeCorrectAnswer() {
        let randomCorrectAnswer =  Int.random(in: 0..<3)
        correctAnswer = randomCorrectAnswer
    }
    
    func getResult(answer:Int,isCorrect:Bool) {
        var str = isCorrect ? "is the correct answer" : "is the wrong answer"
        switch (answer) {
        case 0 :
            gameSubtitle = "Dog" + " " + str
        case 1 :
            gameSubtitle = "Cat" + " " + str
        case 2 :
            gameSubtitle = "Fox" + " " + str
        default:
            gameSubtitle = " "
        }
    }
}
#Preview {
    ContentView()
}
