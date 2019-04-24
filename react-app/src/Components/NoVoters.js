import React, { Component } from "react";
import "../CSS/NoVoters.css";
import {Link} from 'react-router-dom';

class NoVoters extends Component {
  render() {
    return (
      <div className="bground2">
        <div className="error2">
          <div className="container2">
            <h2 className="heading2">NO VOTERS IN YOUR ASSIGNED PRECINCT</h2>
            <Link to="/login">
              <button className="back2" type="submit">
                Back to Login
              </button>
            </Link>
          </div>
        </div>
      </div>
    );
  }
}

export default NoVoters;
