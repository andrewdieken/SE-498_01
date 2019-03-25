import React, { Component } from "react";
import "./Canvas.css";
import red_x from "../Images/red_x.png";
import green_check from "../Images/green_check.png";
import house from "../Images/house.png";
import info from "../Images/info.png";

import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";
import gql from "graphql-tag";

class Canvas extends Component {
  constructor(props) {
    super(props);

    //==============================================================
    //
    //==============================================================
    const client = new ApolloClient ({
      uri: "http://localhost:3000/graphql"
    });
    client.query({query: gql `{
      voterByPrecinct(id:"10316") {
        id,
        szNameFirst}
      }`
    }).then(result => console.log(result.data.voterByPrecinct[0].szNameFirst))
    //==============================================================
    //
    //==============================================================

    this.index = 0;
    this.url = "/api/v1/voters/?page=";
    this.api_page = "1";
    this.state = {
      voters: [
        {
          voterID: 1234567,
          last_name: "Loading...",
          first_name: "Loading...",
          middle_name: "Loading...",
          address: "Loading...",
          city: "Loading...",
          state: "Loading...",
          zip: "Loading...",
          phone: "Loading...",
          email: "Loading...",
          date_of_birth: "00/00/2019",
          party_affiliation: "Loading..."
        }
      ],
      index: 0,
      api_page: "1"
    };
  }

  async componentDidMount() {
    const response = await fetch(this.url + this.api_page);
    const data = await response.json();
    this.setState({ voters: data.data });

  }

  componentDidUpdate() {
    console.log("Component did update");
  }

  componentWillUpdate() {
    console.log("Component will update");
  }

  nextVoter = () => {
    this.index = this.index + 1;
    this._container.className = "main_container_flicker";

    setTimeout(() => {
      this.setState({ index: this.index });
    }, 400);
    if (this.index === this.state.voters.length) {
      this.api_page = (parseInt(this.api_page) + 1).toString();

      setTimeout(() => {
        this.setState({
          api_page: this.api_page,
          index: 0,
          voters: [
            {
              voterID: 1234567,
              last_name: "Loading...",
              first_name: "Loading...",
              middle_name: "Loading...",
              address: "Loading...",
              city: "Loading...",
              state: "Loading...",
              zip: "Loading...",
              phone: "Loading...",
              email: "Loading...",
              date_of_birth: "00/00/2019",
              party_affiliation: "Loading..."
            }
          ]
        });
      }, 400);

      this.index = 0;
      fetch(this.url + this.api_page)
        .then(res => res.json())
        .then(data => this.setState({ voters: data.data }));
    }
    setTimeout(() => {
      this._container.className = "main_container";
    }, 1000);
  };

  render() {
    return (
      <div className="main_container" ref={el => (this._container = el)}>
        <div className="item-a">
          {JSON.parse(
            JSON.stringify(this.state.voters[this.state.index].first_name)
          )}{" "}
          {this.state.voters[this.state.index].last_name}
        </div>
        <div className="item-b">
          {JSON.parse(
            JSON.stringify(
              this.state.voters[this.state.index].party_affiliation
            )
          ).substring(0, 1)}
          <br />
          {new Date().getFullYear() -
            parseInt(
              JSON.parse(
                JSON.stringify(
                  this.state.voters[this.state.index].date_of_birth
                )
              ).substring(6)
            )}
        </div>
        <div className="item-d">
          <h3 className="content">
            {JSON.parse(
              JSON.stringify(
                this.state.voters[this.state.index].party_affiliation
              )
            )}
          </h3>

          {(() => {
            if (
              JSON.parse(
                JSON.stringify(this.state.voters[this.state.index].phone)
              ) === ""
            ) {
              return <h3 className="content">No Phone Provided</h3>;
            } else {
              return (
                <h3 className="content">
                  {JSON.parse(
                    JSON.stringify(this.state.voters[this.state.index].phone)
                  )}{" "}
                </h3>
              );
            }
          })()}
          <img alt="hse" className="info_logo" src={info} />

          {(() => {
            if (
              JSON.parse(
                JSON.stringify(this.state.voters[this.state.index].email)
              ) === ""
            ) {
              return <h3 className="content">No Email Provided</h3>;
            } else {
              return (
                <h3 className="content">
                  {JSON.parse(
                    JSON.stringify(this.state.voters[this.state.index].email)
                  )}{" "}
                </h3>
              );
            }
          })()}
          <h3 className="content1">
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].address)
            )}
            <br />
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].city)
            )}
            ,{" "}
            <br />
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].state)
            )}{" "}
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].zip)
            )}
          </h3>
          <img alt="hse" className="house_logo" src={house} />
        </div>
        <div className="item-e">
          <button
            className="reject"
            onClick={() => {
              this.nextVoter();
            }}
          >
            <img alt="red" className="rx" src={red_x} />
          </button>
          <button className="accept">
            <img alt="green" className="gc" src={green_check} />
          </button>
        </div>
      </div>
    );
  }
}
export default Canvas;
