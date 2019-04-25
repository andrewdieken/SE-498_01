import React, { Component } from "react";
import "../CSS/NoCampaign.css";


class NoCampaign extends Component {
  tryAgain = () => {
    window.location.reload();
  };

  render() {
    return (
      <div className="bground3">
        <div className="error3">
          <div className="container3">
            <h2 className="heading3">
              THERE IS NO CAMPAIGN CURRENTLY IN PROGRESS
            </h2>
            <button
              onClick={() => {
                this.tryAgain();
              }}
              className="back3"
              type="submit"
            >
              Try Again?
            </button>
          </div>
        </div>
      </div>
    );
  }
}

export default NoCampaign;
