import React from "react";
import "../styles.css";

const ScoreTracker = ({ score }) => {
  const percentage =
    score.total > 0 ? Math.round((score.correct / score.total) * 100) : 0;

  return (
    <div className="score-tracker">
      <h2>Your Progress</h2>
      <div className="score-details">
        <div>
          <span className="score-label">Correct:</span>
          <span className="score-value correct">{score.correct}</span>
        </div>
        <div>
          <span className="score-label">Total:</span>
          <span className="score-value">{score.total}</span>
        </div>
        <div>
          <span className="score-label">Percentage:</span>
          <span className="score-value">{percentage}%</span>
        </div>
      </div>
      <div className="progress-bar">
        <div
          className="progress-fill"
          style={{ width: `${percentage}%` }}
        ></div>
      </div>
    </div>
  );
};

export default ScoreTracker;
