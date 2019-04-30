import React, { Component } from "react";
import "../CSS/NoVoters.css";
import authenticate from "../Classes/authenticate";


class NoVoters extends Component {
  render() {
    return (
      <div className="bground2">
        <div className="error2">
          <div className="container2">
            <h2 className="heading2">NO VOTERS IN YOUR ASSIGNED PRECINCT</h2>
              <button onClick={()=>{
                authenticate.logout(()=>{
                  this.props.history.push("/login");
                })
              }} className="back2" type="submit">
                Back to Login
              </button>
          </div>
        </div>
      </div>
    );
  }
}

export default NoVoters;
