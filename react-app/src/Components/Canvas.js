import React, { Component } from "react";
import "./Canvas.css";
import red_x from "../Images/red_x.png";
import green_check from "../Images/green_check.png";
import house from "../Images/house.png";
import info from "../Images/info.png";
import ApolloClient from "apollo-boost";
import gql from "graphql-tag";
import axios from "axios";

class Canvas extends Component {
  constructor(props) {
    super(props);

    if (process.env.NODE_ENV == "production") {
      this.postLink = "https://api.quartiledocs.com/api/v1/visits";
      this.client = new ApolloClient({
        uri: "https://api.quartiledocs.com/graphql"
      });
    } else {
      this.postLink = "http://192.168.99.100:3000/api/v1/visits";
      this.client = new ApolloClient({
        uri: "http://192.168.99.100:3000/graphql"
      });
    }

    this.index = 0;
    this.state = {
      voters: [
        {
          szNameLast: "Loading...",
          szNameFirst: "Loading...",
          szSitusAddress: "Loading...",
          szSitusCity: "Loading...",
          sSitusState: "Loading...",
          sSitusZip: "Loading...",
          szPhone: "Loading...",
          szEmailAddress: "Loading...",
          dtBirthDate: "1/1/2019",
          szPartyName: "Loading..."
        }
      ],
      index: 0
    };
  }

  componentDidMount() {
    this.client
      .query({
        query: gql`
          {
            voterByPrecinct {
              id
              szNameFirst
              szNameLast
              szSitusAddress
              szSitusCity
              sSitusState
              sSitusZip
              dtBirthDate
              szPartyName
              szPhone
              szEmailAddress
            }
          }
        `
      })
      .then(result => this.setState({ voters: result.data.voterByPrecinct }));
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
    if (!Array.isArray(this.state.voters) || !this.state.voters.length) {
      this.setState({
        voters: [
          {
            szNameLast: "Loading...",
            szNameFirst: "Loading...",
            szSitusAddress: "Loading...",
            szSitusCity: "Loading...",
            sSitusState: "Loading...",
            sSitusZip: "Loading...",
            szPhone: "Loading...",
            szEmailAddress: "Loading...",
            dtBirthDate: "1/1/2019",
            szPartyName: "Loading..."
          }
        ],
        index: 0
      });
    } else if (this.index === this.state.voters.length) {
      this.index = 0;
      this.setState({ index: this.index });
    }
    setTimeout(() => {
      this._container.className = "main_container";
    }, 1000);
  };

  acceptVoter = () => {
    axios
      .post(this.postLink, {
        id: JSON.stringify(this.state.voters[this.state.index].id)
      })
      .then(function(response) {
        console.log(response);
      })
      .catch(function(error) {
        console.log(error);
      });

    this.index = this.index + 1;

    setTimeout(() => {
      this.setState({ index: this.index });
    }, 400);
    if (!Array.isArray(this.state.voters) || !this.state.voters.length) {
      this.setState({
        voters: [
          {
            szNameLast: "Loading...",
            szNameFirst: "Loading...",
            szSitusAddress: "Loading...",
            szSitusCity: "Loading...",
            sSitusState: "Loading...",
            sSitusZip: "Loading...",
            szPhone: "Loading...",
            szEmailAddress: "Loading...",
            dtBirthDate: "1/1/2019",
            szPartyName: "Loading..."
          }
        ],
        index: 0
      });
    } else if (this.index === this.state.voters.length) {
      this.index = 0;
      this.setState({ index: this.index });
    }
  };

  animateSuccess = () => {
    this._container.classList.remove("main_container_flicker_right");
    void this._container.offsetWidth;
    this._container.classList.add("main_container_flicker_right");
    setTimeout(() => {
      this._container.className = "main_container";
    }, 1000);
  };

  render() {
    return (
      <div className="main_container" ref={el => (this._container = el)}>
        <div className="item-a">
          {JSON.parse(
            JSON.stringify(this.state.voters[this.state.index].szNameFirst)
          )}{" "}
          <br />
          {this.state.voters[this.state.index].szNameLast}
        </div>
        <div className="item-b">
          {JSON.parse(
            JSON.stringify(this.state.voters[this.state.index].szPartyName)
          ).substring(0, 1)}
          <br />
          {new Date().getFullYear() -
            parseInt(
              JSON.parse(
                JSON.stringify(
                  new Date(this.state.voters[this.state.index].dtBirthDate)
                )
              ).substring(0, 5)
            )}
        </div>
        <div className="item-d">
          <h3 className="content">
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].szPartyName)
            )}
          </h3>

          {(() => {
            if (
              JSON.parse(
                JSON.stringify(this.state.voters[this.state.index].szPhone)
              ) === null ||
              JSON.parse(
                JSON.stringify(this.state.voters[this.state.index].szPhone)
              ) === "none"
            ) {
              return <h3 className="content">No Phone Provided</h3>;
            } else {
              return (
                <h3 className="content">
                  {JSON.parse(
                    JSON.stringify(this.state.voters[this.state.index].szPhone)
                  )}{" "}
                </h3>
              );
            }
          })()}
          <img alt="hse" className="info_logo" src={info} />

          {(() => {
            if (
              JSON.parse(
                JSON.stringify(
                  this.state.voters[this.state.index].szEmailAddress
                )
              ) === null ||
              JSON.parse(
                JSON.stringify(
                  this.state.voters[this.state.index].szEmailAddress
                )
              ) === "none"
            ) {
              return <h3 className="content">No Email Provided</h3>;
            } else {
              return (
                <h3 className="content">
                  {JSON.parse(
                    JSON.stringify(
                      this.state.voters[this.state.index].szEmailAddress
                    )
                  )}{" "}
                </h3>
              );
            }
          })()}
          <h3 className="content1">
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].szSitusAddress)
            )}
            <br />
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].szSitusCity)
            )}
            , <br />
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].sSitusState)
            )}{" "}
            {JSON.parse(
              JSON.stringify(this.state.voters[this.state.index].sSitusZip)
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
          <button
            className="accept"
            onClick={() => {
              this.animateSuccess();
              this.acceptVoter();
            }}
          >
            <img alt="green" className="gc" src={green_check} />
          </button>
        </div>
      </div>
    );
  }
}
export default Canvas;
