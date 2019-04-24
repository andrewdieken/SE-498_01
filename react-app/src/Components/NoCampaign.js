import React, { Component } from "react";

class NoCampaign extends Component {
  tryAgain = () => {
    window.location.reload();
  };

  render() {
    return (
      <div className="bground2">
        <div className="error2">
          <div className="container2">
            <h2 className="heading2">
              THERE IS NOT CAMPAIGN CURRENTLY IN PROGRESS
            </h2>
            <button
              onClick={() => {
                this.tryAgain();
              }}
              className="back2"
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
