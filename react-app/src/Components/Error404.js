import React, { Component } from "react";
import "../CSS/Error404.css";
import { Link } from "react-router-dom";

class Error404 extends Component {
  render() {
    return (
      <div className="bground1">
      <div className="error">
        <div className="container1">
          <h2 className="heading1">404 PAGE NOT FOUND</h2>
          <Link to="/login">
          <button className="back" type="submit">
            Back to Login
          </button>
          </Link>
        </div>
      </div>
      </div>
    );
  }
}

export default Error404;
