import React, { useState } from "react";
import "../styles.css";

const QuestionItem = ({ question, onAnswer }) => {
  const [showAnswer, setShowAnswer] = useState(false);
  const [userResponse, setUserResponse] = useState(null);

  const handleShowAnswer = () => {
    setShowAnswer(!showAnswer);
  };

  const handleUserResponse = (isCorrect) => {
    setUserResponse(isCorrect ? "correct" : "wrong");
    onAnswer(isCorrect);
  };

  return (
    <div className={`question-item ${userResponse}`}>
      <div className="question-header">
        <h3>{question.question}</h3>
        <span className={`difficulty ${question.difficulty}`}>
          {question.difficulty}
        </span>
      </div>
      <div className="question-category">Category: {question.category}</div>

      <button onClick={handleShowAnswer} className="show-answer-btn">
        {showAnswer ? "Hide Answer" : "Show Answer"}
      </button>

      {showAnswer && (
        <div className="answer-section">
          <div className="answer">{question.answer}</div>
          <div className="response-buttons">
            <p>Did you get it right?</p>
            <button
              onClick={() => handleUserResponse(true)}
              className="response-btn correct-btn"
              disabled={userResponse !== null}
            >
              Yes
            </button>
            <button
              onClick={() => handleUserResponse(false)}
              className="response-btn wrong-btn"
              disabled={userResponse !== null}
            >
              No
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default QuestionItem;
