import React, { Component } from "react";
import "../CSS/Login.css";
import authenticate from "../Classes/authenticate";
import ApolloClient from "apollo-boost";
import gql from "graphql-tag";
import NoCampaign from "../Components/NoCampaign";

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
      global_password: "xxx-xxx-xxx",
      isLoaded: true
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
      .then(result =>
        this.setState({ global_password: result.data.getCanvasserPassword })
      )
      .catch(error => {
        this.setState({ isLoaded: true });
      });
  }

  render() {
    if (!this.state.isLoaded) {
      return <NoCampaign />;
    } else {
      return (
        <div className="bground">
          <h2 className="heading">Ready to Canvas?</h2>
          <div className="login-form">
            <div className="container">
              <label className="special" htmlFor="uname">
                <h4 className="lbl">Name</h4>
              </label>
              <input
                className="inp"
                type="text"
                placeholder="Enter your Name"
                name="uname"
                ref={unme => (this._name = unme)}

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
                ref={pwd => (this._password = pwd)}
              />
              <button
                onClick={() => {
                  authenticate.login(
                    this.state.global_password,
                    this._password.value,this._name.value,
                    () => {
                      this.props.history.push("/");
                    }
                  );
                }}
                className="login"
              >
                Login
              </button>
            </div>
          </div>
        </div>
      );
    }
  }
}

export default Login;
