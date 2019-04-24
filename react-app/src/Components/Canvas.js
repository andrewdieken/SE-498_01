import React, { Component } from "react";
import "../CSS/Canvas.css";
import house from "../Images/house.png";
import info from "../Images/info.png";
import map from "../Images/map.png";
import x_house from "../Images/reject_house.png";
import nts from "../Images/notes.png";
import ApolloClient from "apollo-boost";
import gql from "graphql-tag";
import axios from "axios";
import { Link } from "react-router-dom";

class Canvas extends Component {
  constructor(props) {
    super(props);

    if (process.env.NODE_ENV == "production") {
      this.postLink = "https://api.quartiledocs.com/api/v1/visits";
      this.patchLink = "https://api.quartiledocs.com/api/v1/voters/";
      this.client = new ApolloClient({
        uri: "https://api.quartiledocs.com/graphql"
      });
    } else {
      this.postLink = "http://192.168.99.100:3000/api/v1/visits";
      this.patchLink = "http://192.168.99.100:3000/api/v1/voters/";

      this.client = new ApolloClient({
        uri: "http://192.168.99.100:3000/graphql"
      });
    }

    this.index = 0;
    this.state = {
      voters: [
        {
          szNameLast: "Loading...",
          szNameFirst: "Loading",
          szSitusAddress: "Loading...",
          szSitusCity: "Loading...",
          sSitusState: "Loading...",
          sSitusZip: "Loading...",
          szPhone: "Loading...",
          szEmailAddress: "Loading...",
          dtBirthDate: "1/1/2019",
          szPartyName: "Loading...",
          note: ""
        }
      ],
      index: 0,
      notes: "testing",
      voterScore: "4",
      isLoaded: "1"
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
              note
            }
          }
        `
      })
      .then(result =>
        this.setState({ voters: result.data.voterByPrecinct, isLoaded: "2" })
      )
      .catch(error => {
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
              szPartyName: "Loading...",
              note: ""
            }
          ], isLoaded:"0"
        });
      });
  }

  componentDidUpdate() {}

  componentWillUpdate() {}

  handleChange = event => {
    let voters = [...this.state.voters];
    let voter = { ...voters[this.state.index] };
    voter.note = event.target.value;
    voters[this.state.index] = voter;
    this.setState({ voters });
  };

  nextVoter = () => {
    this.index = this.index + 1;
    this._container.className = "main_container_flicker";

    setTimeout(() => {
      this.setState({ index: this.index });
      this._tarea.value = this.state.voters[this.index].note;
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
            szPartyName: "Loading...",
            note: "Loading..."
          }
        ],
        index: 0,
        isLoaded: "3"
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
      this._tarea.value = this.state.voters[this.index].note;
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
            szPartyName: "Loading...",
            note: "Loading..."
          }
        ],
        index: 0,
        isLoaded: "3"
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

  openNote = () => {
    this._bgmodal.style.display = "flex";
  };

  closeNote = () => {
    this._bgmodal.style.display = "none";
  };

  updateNote = () => {
    axios
      .patch(this.patchLink + this.state.voters[this.state.index].id, {
        note: this._tarea.value
      })
      .then(function(response) {
        console.log(response);
      })
      .catch(function(error) {
        console.log(error);
      });

    this._bgmodal.style.display = "none";
  };

  openMaps = () => {
    var address = JSON.stringify(
      this.state.voters[this.state.index].szSitusAddress
    );
    var city = JSON.stringify(this.state.voters[this.state.index].szSitusCity);
    var state = JSON.stringify(this.state.voters[this.state.index].sSitusState);
    var zip = JSON.stringify(this.state.voters[this.state.index].sSitusZip);
    var map =
      "https://www.google.com/maps/search/?api=1&query=" +
      address +
      "+" +
      city +
      "+" +
      state +
      "+" +
      zip +
      '"';
    window.open(map, "_blank");
  };

  render() {
    if (
      JSON.parse(
        JSON.stringify(this.state.voters[this.state.index].szNameFirst)
      ) === "Loading..."
    ) {
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
    } else if (this.state.isLoaded === "1") {
      return (
        <div className="bground2">
          <div className="error2">
            <div className="container2">
              <h2 className="heading4">Loading Voters</h2>
            </div>
          </div>
        </div>
      );
    } else {
      return (
        <div className="App-header">
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
                  JSON.stringify(
                    this.state.voters[this.state.index].szPartyName
                  )
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
                        JSON.stringify(
                          this.state.voters[this.state.index].szPhone
                        )
                      )}{" "}
                    </h3>
                  );
                }
              })()}
              <img alt="hse" className="info_logo" src={info} />
              {(() => {
                if (parseInt(this.state.voterScore) < 3) {
                  return <h3 className="red">{this.state.voterScore}</h3>;
                } else if (
                  parseInt(this.state.voterScore) <= 4 &&
                  parseInt(this.state.voterScore) >= 3
                ) {
                  return <h3 className="orange">{this.state.voterScore}</h3>;
                } else if (parseInt(this.state.voterScore) >= 5) {
                  return <h3 className="green">{this.state.voterScore}</h3>;
                }
              })()}

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
                <span
                  onClick={() => {
                    this.openMaps();
                  }}
                >
                  {JSON.parse(
                    JSON.stringify(
                      this.state.voters[this.state.index].szSitusAddress
                    )
                  )}
                  <br />
                  {JSON.parse(
                    JSON.stringify(
                      this.state.voters[this.state.index].szSitusCity
                    )
                  )}
                  , <br />
                  {JSON.parse(
                    JSON.stringify(
                      this.state.voters[this.state.index].sSitusState
                    )
                  )}{" "}
                  {JSON.parse(
                    JSON.stringify(
                      this.state.voters[this.state.index].sSitusZip
                    )
                  )}
                </span>
              </h3>
              <img alt="mpe" className="map_logo" src={map} />
            </div>
            <div className="item-e">
              <button
                className="reject"
                type="button"
                onClick={() => {
                  this.nextVoter();
                }}
              >
                <img alt="hse" className="x_house_logo" src={x_house} />
              </button>
              <button
                className="notes_button"
                onClick={() => {
                  this.openNote();
                }}
              >
                <img alt="nts" className="notes" src={nts} />
              </button>
              <button
                className="accept"
                type="button"
                onClick={() => {
                  this.animateSuccess();
                  this.acceptVoter();
                }}
              >
                <img alt="hse" className="house_logo" src={house} />
              </button>
            </div>
            <div className="bg-modal" ref={mode => (this._bgmodal = mode)}>
              <div className="modal-contents">
                <h3 className="notes_heading">Voter Notes:</h3>
                <div
                  className="close"
                  onClick={() => {
                    this.closeNote();
                  }}
                >
                  +
                </div>

                <div>
                  <textarea
                    cols="40"
                    rows="5"
                    className="modal-input"
                    type="text"
                    placeholder="Notes:"
                    ref={txt => (this._tarea = txt)}
                    value={JSON.parse(
                      JSON.stringify(this.state.voters[this.state.index].note)
                    )}
                    onChange={this.handleChange}
                  />
                  <button
                    onClick={() => {
                      this.updateNote();
                    }}
                    className="button-modal"
                  >
                    Submit
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      );
    }
  }
}
export default Canvas;
