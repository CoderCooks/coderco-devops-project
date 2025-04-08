import React, { useState } from "react";
import questions from "../data/questions";
import QuestionItem from "./QuestionItem";
import ScoreTracker from "./ScoreTracker";
import "../styles.css";

const QuestionList = () => {
  const [score, setScore] = useState({ correct: 0, total: 0 });

  const handleAnswer = (isCorrect) => {
    setScore((prev) => ({
      correct: isCorrect ? prev.correct + 1 : prev.correct,
      total: prev.total + 1,
    }));
  };

  return (
    <div className="question-list-container">
      <h1>Linux Interview Quiz</h1>
      <p>Test your Linux knowledge with these interview questions</p>

      <ScoreTracker score={score} />

      <div className="questions-container">
        {questions.map((question) => (
          <QuestionItem
            key={question.id}
            question={question}
            onAnswer={handleAnswer}
          />
        ))}
      </div>
    </div>
  );
};

export default QuestionList;
