import React, { Component } from "react";
import "../CSS/Login.css";
import authenticate from "../Classes/authenticate";
import ApolloClient from "apollo-boost";
import gql from "graphql-tag";
import NoCampaign from "../Components/NoCampaign";
import NoInternet from "./NoInternet";
import axios from "axios";


class Login extends Component {
  constructor(props) {
    super(props);
    if (process.env.NODE_ENV == "production") {
      this.client = new ApolloClient({
        uri: "https://api.campaignify.net/graphql"
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
        this.setState({ isLoaded: false });
      });
  }
  render() {
    if (!this.state.isLoaded) {
      return <NoInternet />;
    } else if (!this.state.global_password.match(/[0-9a-zA-Z]/i)) {
      return <NoCampaign />;
    } else {
      return (
        <div className="bground">
          <h2 className="heading">Welcome to Campaignify</h2>
          <h4 className="headingsub">Please Login below...</h4>
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
                    this._password.value,
                    this._name.value,
                    () => {
                      this.props.history.push("/");
                    },
                    () => {
                      if (process.env.NODE_ENV == "production") {
                        this.postLink2 = `https://api.campaignify.net/api/v1/stats/update_volunteers?volunteers=${1}`;
                      } else {
                        this.postLink2 = `http://192.168.99.100:3000/api/v1/stats/update_volunteers?volunteers=${1}`;
                      }
                      axios
                        .post(this.postLink2)
                        .then(function(response) {
                          console.log(response);
                        })
                        .catch(function(error) {
                          console.log(error);
                        });
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
