//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Jaskirat Singh on 3/14/25.
//

import UIKit

class TriviaViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var questionCategoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButtonA: UIButton!
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var answerButtonD: UIButton!
    
    // MARK: - Properties
      let triviaData = TriviaQuestions()      // Our list of questions
      var currentQuestionIndex = 0            // Tracks which question user is on
      var score = 0                           // Tracks how many correct answers so far
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.layer.cornerRadius = 8
        questionLabel.layer.masksToBounds = true
        
        // Initialize UI with first question
        updateUI()
    }

    /// Updates the UI to display the current question, its category, etc.
        func updateUI() {
            // Guard against going out of bounds in our array
            if currentQuestionIndex < triviaData.questions.count {
                
                let currentQuestion = triviaData.questions[currentQuestionIndex]
                
                // Update question label
                questionLabel.text = currentQuestion.text
                // Update category label
                questionCategoryLabel.text = currentQuestion.category
                
                // Update answer buttons
                answerButtonA.setTitle(currentQuestion.answers[0], for: .normal)
                answerButtonB.setTitle(currentQuestion.answers[1], for: .normal)
                answerButtonC.setTitle(currentQuestion.answers[2], for: .normal)
                answerButtonD.setTitle(currentQuestion.answers[3], for: .normal)
                
                // Update question counter label (e.g. "Question 1 of 3")
                questionCounterLabel.text = "Question \(currentQuestionIndex + 1) of \(triviaData.questions.count)"
                
            } else {
                // If currentQuestionIndex >= number of questions, user has finished the quiz
                showFinalScore()
            }
        }
    
    /// Show user's final score when they finish all questions
        func showFinalScore() {
            // You can display this however you'd like (alert, new screen, label)
            // Below is an alert approach.
            let alertController = UIAlertController(
                title: "Quiz Complete",
                message: "You got \(score) out of \(triviaData.questions.count) correct!",
                preferredStyle: .alert
            )
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { [weak self] _ in
                self?.restartGame()
            }
            alertController.addAction(restartAction)
            
            present(alertController, animated: true, completion: nil)
        }
    
    /// Reset the game so user can try again
    func restartGame() {
        currentQuestionIndex = 0
        score = 0
        updateUI()
    }
    
    /// One IBAction for all four answer buttons. Distinguish by sender.
    @IBAction func answerTapped(_ sender: UIButton) {
        // Guard that we haven't finished all questions
        guard currentQuestionIndex < triviaData.questions.count else { return }
        
        // Determine which button was tapped and compare to correct answer
        let currentQuestion = triviaData.questions[currentQuestionIndex]
        
        // In IB, set the "tag" property of each button to the index of its answer
        // e.g. answerButtonA.tag = 0, answerButtonB.tag = 1, etc.
        // Then we can read which button was tapped:
        let correctAnswerIndex = currentQuestion.correctAnswerIndex
        
        if sender.tag == correctAnswerIndex {
            score += 1
        }
        
        // Move on to next question
        currentQuestionIndex += 1
        updateUI()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
