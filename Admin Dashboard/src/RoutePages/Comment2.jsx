import React from "react";
import "./Comments.css"; // External CSS file
import {SquareUserRound} from 'lucide-react';

const commentsData = [
  {
    name: "Jagarnath S.",
    rating: 4,
    comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    name: "Jagarnath S.",
    rating: 5,
    comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
  {
    name: "Jagarnath S.",
    rating: 3,
    comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  },
];

const Comment2 = () => {
  return (
    <div className="comments-container">
      <h3 className="comments-header">New Comments</h3>
      {commentsData.map((item, index) => (
        <div className="comment-box" key={index}>
         <SquareUserRound className="user-icon"/>
          <div className="comment-content">
            <p className="user-name">{item.name}</p>
            <div className="rating">
              {Array(5)
                .fill(0)
                .map((_, i) => (
                  <span key={i} className={i < item.rating ? "star filled" : "star"}>
                    ★
                  </span>
                ))}
            </div>
            <p className="comment-text">{item.comment}</p>
          </div>
        </div>
      ))}
    </div>
  );
};

export default Comment2;
