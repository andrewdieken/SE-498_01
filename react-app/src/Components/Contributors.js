import React, { Component } from "react";
import "../CSS/Contributors.css";

class Contributors extends Component {
  render() {
    return (
        <div className="bground7">
      <div className="error7">
        <div className="container7">
          <h2 className="heading7">Contributors</h2>
          <div className="hold7">
            <h4 className="heading7">Back End Lead:</h4>{" "}
            <h5 className="name7">Xavi Ablaza</h5>
          </div>
          <div className="hold7">
            <h4 className="heading7">Back End Engineer:</h4>{" "}
            <h5 className="name7">Andrew Dieken</h5>
          </div>
          <div className="hold7">
            <h4 className="heading7">Front End Lead:</h4>{" "}
            <h5 className="name7">Brandon Lavinsky</h5>
          </div>
          <div className="hold7">
            <h4 className="heading7">Front End Engineer:</h4>{" "}
            <h5 className="name7">Riccardo Angiolini</h5>
          </div>

          <div className="hold7">
            <h4 className="heading7">Test Engineer:</h4>{" "}
            <h5 className="name7">Alberto Garibay</h5>
            <h5 className="name7">Chris Ruiz</h5>
          </div>

          <div className="hold7">
            <h4 className="heading7">Moderator: </h4>{" "}
            <h5 className="name7">Nathaniel Elder</h5>
          </div>
        </div>
      </div>
      </div>
    );
  }
}

export default Contributors;
