import React, { Component } from "react";
import "../CSS/Canvas.css";
import house from "../Images/house.png";
import info from "../Images/info.png";
import map from "../Images/map.png";
import x_house from "../Images/reject_house.png";
import nts from "../Images/notes.png";
import lgt from "../Images/logout.png";
import ApolloClient from "apollo-boost";
import gql from "graphql-tag";
import axios from "axios";
import NoVoters from "../Components/NoVoters";
import NoInternet from "../Components/NoInternet";
import authenticate from "../Classes/authenticate";
class Canvas extends Component {
  constructor(props) {
    super(props);

    if (process.env.NODE_ENV == "production") {
      this.patchLink = "https://api.quartiledocs.com/api/v1/voters/";
      this.client = new ApolloClient({
        uri: "https://api.quartiledocs.com/graphql"
      });
    } else {
      this.patchLink = "http://192.168.99.100:3000/api/v1/voters/";
      this.client = new ApolloClient({
        uri: "http://192.168.99.100:3000/graphql"
      });
    }
    this.index = 0;
    this.score = JSON.parse(localStorage.getItem("score")) || 0;
    this.counter = JSON.parse(localStorage.getItem("counter")) || 0;

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
          szPartyName: "Loading...",
          note: "",
          historyScore: 0
        }
      ],
      index: 0,
      notes: "testing",
      isLoaded: "1",
      manager_notes: "-Loading..."
    };
  }

  componentDidMount() {
    this.getLocation();
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
            getDefaultNote
          }
        `
      })
      .then(result =>
        this.setState({
          voters: result.data.voterByPrecinct,
          isLoaded: "2",
          manager_notes: result.data.getDefaultNote
        })
      )
      .catch(error => {
        this.setState({
          isLoaded: "3"
        });
      });
  }

  componentDidUpdate() {
    if (this.state.isLoaded === "2" && this.state.voters.length) {
      this._myBar.style.width = this.score + "%";
    } else {
      return;
    }
  }

  componentWillUpdate() {}

  getLocation = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(this.showPosition);
    } else {
      console.log("Geolocation is not supported by this browser.");
    }
  };

  showPosition = position => {
    console.log(position.coords.latitude);
    console.log(position.coords.longitude);
  };

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
    this._myBar.style.visibility = "hidden";
    this._myPG.style.visibility = "hidden";

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
            note: "Loading...",
            historyScore: 0
          }
        ],
        index: 0,
        isLoaded: "3"
      });
    } else if (this.index === this.state.voters.length) {
      window.location.reload();
      this.index = 0;
      this.setState({ index: this.index });
    }
    setTimeout(() => {
      this._container.className = "main_container";
      this._myBar.style.visibility = "visible";
      this._myPG.style.visibility = "visible";
    }, 1000);
  };

  acceptVoter = () => {
    if (process.env.NODE_ENV == "production") {
      this.postLink = `https://api.quartiledocs.com/api/v1/visits?id=${
        this.state.voters[this.state.index].id
      }`;
    } else {
      this.postLink = `http://192.168.99.100:3000/api/v1/visits?id=${
        this.state.voters[this.state.index].id
      }`;
    }
    axios
      .post(this.postLink)
      .then(function(response) {
        console.log(response);
      })
      .catch(function(error) {
        console.log(error);
      });

    this.index = this.index + 1;
    this.counter = this.counter + 1;
    localStorage.setItem("counter", this.counter);
    setTimeout(() => {
      if (this.counter === 10) {
        alert(
          "Great Job! You have canvassed 10 houses in your precinct. Keep going!"
        );
      } else if (this.counter === 30) {
        alert("Wow! 30 completed, more to come!");
      } else if (this.counter === 50) {
        alert("Unbelievable! 50 and counting, you're a star!");
      } else if (this.counter === 100) {
        alert(
          "Incredible, you have now canvassed 100 houses. You're a legend! "
        );
      }

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
            note: "Loading...",
            historyScore: 0
          }
        ],
        index: 0,
        isLoaded: "3"
      });
    } else if (this.index === this.state.voters.length) {
      window.location.reload();
      this.index = 0;
      this.setState({ index: this.index });
    }
  };

  animateSuccess = () => {
    this._container.classList.remove("main_container_flicker_right");
    this._myBar.style.visibility = "hidden";
    this._myPG.style.visibility = "hidden";
    void this._container.offsetWidth;
    this._container.classList.add("main_container_flicker_right");
    setTimeout(() => {
      this._container.className = "main_container";
      this._myBar.style.visibility = "visible";
      this._myPG.style.visibility = "visible";
    }, 1000);
  };

  openNote = () => {
    this._bgmodal.style.display = "flex";
    this._myBar.style.visibility = "hidden";
    this._myPG.style.visibility = "hidden";
  };

  closeNote = () => {
    this._bgmodal.style.display = "none";
    this._myBar.style.visibility = "visible";
    this._myPG.style.visibility = "visible";
    let voters = [...this.state.voters];
    let voter = { ...voters[this.state.index] };
    voter.note = "";
    voters[this.state.index] = voter;
    this.setState({ voters });
  };

  updateNote = () => {
    axios
      .patch(this.patchLink + this.state.voters[this.state.index].id, {
        note: this._tarea.value
      })
      .then(function(response) {})
      .catch(function(error) {});

    this._bgmodal.style.display = "none";
    this._myBar.style.visibility = "visible";
    this._myPG.style.visibility = "visible";
  };

  increaseScore = () => {
    if (this.score >= 100) {
      this.score = 10;
      localStorage.setItem("score", this.score);
      this._myBar.style.width = this.score + "%";
    } else {
      this.score = this.score + 10;
      localStorage.setItem("score", this.score);
      this._myBar.style.width = this.score + "%";
    }
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
    if (this.state.isLoaded === "1") {
      return (
        <div className="bground4">
          <div className="error4">
            <div className="container4">
              <h2 className="heading4">Loading Voters</h2>
            </div>
          </div>
        </div>
      );
    } else if (this.state.isLoaded === "3") {
      return <NoInternet />;
    } else if (!Array.isArray(this.state.voters) || !this.state.voters.length) {
      return <NoVoters />;
    } else {
      return (
        <div className="App-header">
          <button
            className="logout"
            type="button"
            onClick={() => {
              if (
                window.confirm(
                  "Are you sure you want to logout? Your score will be lost..."
                )
              ) {
                authenticate.logout(
                  () => {
                    this.props.history.push("/login");
                  },
                  () => {
                    this.client
                      .query({
                        query: gql`
                    mutation {
                      updateHouses(numberOfHouses: ${this.counter}) {
                        success
                      }
                    }
                    `
                      })
                      .then(result => console.log(result))
                      .catch(error => {
                        console.log(error);
                      });
                  }
                );
              } else {
                return;
              }
            }}
          >
            <span className="btn-txt">Quit</span>{" "}
            <img alt="hse" className="logout_logo" src={lgt} />
          </button>
          <div ref={pg => (this._myPG = pg)} className="myProgress">
            <div ref={prog => (this._myBar = prog)} className="myBar" />
          </div>

          <div className="main_container" ref={el => (this._container = el)}>
            <div className="item-a">
              {JSON.parse(
                JSON.stringify(this.state.voters[this.state.index].szNameFirst)
              )}{" "}
              {this.state.voters[this.state.index].szNameLast}
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
                  return <h3 className="content">No phone provided</h3>;
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
                if (
                  parseInt(this.state.voters[this.state.index].historyScore) < 3
                ) {
                  return (
                    <h3 className="red">
                      {this.state.voters[this.state.index].historyScore}
                    </h3>
                  );
                } else if (
                  parseInt(this.state.voters[this.state.index].historyScore) <=
                    6 &&
                  parseInt(this.state.voters[this.state.index].historyScore) >=
                    3
                ) {
                  return (
                    <h3 className="orange">
                      {this.state.voters[this.state.index].historyScore}
                    </h3>
                  );
                } else if (
                  parseInt(this.state.voters[this.state.index].historyScore) >=
                  7
                ) {
                  return (
                    <h3 className="green">
                      {this.state.voters[this.state.index].historyScore}
                    </h3>
                  );
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
                  return <h3 className="content">No email provided</h3>;
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
              <h3 className="content">
                {new Date().getFullYear() -
                  parseInt(
                    JSON.parse(
                      JSON.stringify(
                        new Date(
                          this.state.voters[this.state.index].dtBirthDate
                        )
                      )
                    ).substring(0, 5)
                  )}{" "}
                years old
              </h3>
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
                  var theNote = this.state.voters[this.state.index].note;
                  if (theNote === null) {
                    theNote = "";
                  }
                  if (theNote.match(/[0-9a-zA-Z]/i)) {
                    this.animateSuccess();
                    this.acceptVoter();
                    this.increaseScore();
                  } else {
                    alert(
                      "Please add some notes to this voter before proceeding."
                    );
                  }
                }}
              >
                <img alt="hse" className="house_logo" src={house} />
              </button>
            </div>
            <div className="bg-modal" ref={mode => (this._bgmodal = mode)}>
              <div className="modal-contents">
                <h3 className="notes_heading2">Campaign Manager Notes:</h3>
                <textarea
                  cols="40"
                  rows="5"
                  className="modal-input2"
                  type="text"
                  placeholder="Default Notes:"
                  readOnly
                  value={JSON.parse(JSON.stringify(this.state.manager_notes))}
                />
                <h3 className="notes_heading">Voter Notes:</h3>

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
                      this.closeNote();
                    }}
                    className="button-modal2"
                  >
                    Cancel
                  </button>
                  <button
                    onClick={() => {
                      var theNote = this.state.voters[this.state.index].note;
                      if (theNote === null) {
                        theNote = "";
                      }
                      if (theNote.match(/[0-9a-zA-Z]/i)) {
                        this.updateNote();
                      } else {
                        alert(
                          "You cannot submit an empty note please add some."
                        );
                      }
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
