import React, { Component } from "react";
import "./Login.css";
import authenticate from "../Classes/authenticate";
import ApolloClient from "apollo-boost";
import gql from "graphql-tag";

class Login extends Component {
  constructor(props) {
    super(props);
    if (process.env.NODE_ENV == "production") {
      this.client = new ApolloClient({
        uri: "https://api.quartiledocs.com/graphql"
      });
    } else {
      this.client = new ApolloClient({
        uri: "http://192.168.99.100:3000/graphql"
      });
    }

    this.state = {
      global_password: ""
    };
  }

  componentDidMount() {
    this.client
      .query({
        query: gql`
          {
            getCanvasserPassword
          }
        `
      })
      // .then(result => this.setState({ global_password: result.data.getCanvasserPassword}))
      .then(result => console.log(result))
      .catch(function(error) {
        alert(
          "There is no active campaign, please contact your campaign manager."
        );
      });
  }

  render() {
    return (
      <div>
        <h2 className="heading">Ready to Canvas?</h2>
        <form className="login-form" action="">
          <div className="container">
            <label className="special" htmlFor="uname">
              <h4 className="lbl">Name</h4>
            </label>
            <input
              className="inp"
              type="text"
              placeholder="Enter your Name"
              name="uname"
              required
            />
            <label htmlFor="psw">
              <h4 className="lbl">Password</h4>
            </label>
            <input
              className="inp"
              type="password"
              placeholder="Enter Password"
              name="psw"
              required
            />
            <button
              onClick={() => {
                authenticate.login("123", "123", () => {
                  this.props.history.push("/");
                });
              }}
              className="login"
              type="submit"
            >
              Login
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default Login;
