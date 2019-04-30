import React, { Component } from "react";
import "../CSS/NoInternet.css";

class NoInternet extends Component {
  render() {
    return (
      <div className="bground6">
        <div className="error6">
          <div className="container6">
            <h2 className="heading6">NO INTERNET CONNECTION</h2>
            <div className="hold">
              <h5 className="name6">
                Please verify that your device is connected to the internet...
              </h5>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default NoInternet;
