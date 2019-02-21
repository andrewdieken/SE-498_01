import React, { Component } from "react";
import "./Canvas.css";
import red_x from "../Images/red_x.png";
import green_check from "../Images/green_check.png";
import house from "../Images/house.png";
import info from "../Images/info.png";
class Canvas extends Component {
  constructor(props) {
    super(props);
    this.state = {
      voters: [
        {
          voterID: 1234567,
          last_name: "Santos",
          first_name: "Juan",
          middle_name: "M",
          address: "864 N Kraber St",
          city: "Fullerton",
          state: "CA",
          zip: "92831",
          phone: "714-543-2109",
          email: "sample_email@example.com",
          date_of_birth: "07/23/1935",
          party_affiliation: "Republican"
        },
        {
          voterID: 7654321,
          last_name: "De La Cruz",
          first_name: "Jane",
          middle_name: "A",
          address: "132 E Madrigal St",
          city: "Orange",
          state: "CA",
          zip: "92866",
          phone: "714-481-7985",
          email: "",
          date_of_birth: "12/02/1952",
          party_affiliation: "Democrat"
        }
      ],
      index: 0
    };
  }

  nextVoter = () => {
    this.setState({
      index: this.state.index + 1
    });
  };

  render() {
    return (
      <div className="main_container">
        <div className="item-a">
          {this.state.voters[this.state.index].first_name}{" "}
          {this.state.voters[this.state.index].last_name}
        </div>
        <div className="item-b">
          {this.state.voters[this.state.index].party_affiliation.substring(
            0,
            1
          )}
          <br />
          {new Date().getFullYear() -
            parseInt(
              this.state.voters[this.state.index].date_of_birth.substring(6)
            )}
        </div>
        <div className="item-d">
          <h3 className="content">
            {this.state.voters[this.state.index].party_affiliation}
          </h3>

          {(() => {
            if (this.state.voters[this.state.index].phone === "") {
              return <h3 className="content">No Phone Provided</h3>;
            } else {
              return (
                <h3 className="content">
                  {this.state.voters[this.state.index].phone}{" "}
                </h3>
              );
            }
          })()}
          <img alt="hse" className="info_logo" src={info} />

          {(() => {
            if (this.state.voters[this.state.index].email === "") {
              return <h3 className="content">No Email Provided</h3>;
            } else {
              return (
                <h3 className="content">
                  {this.state.voters[this.state.index].email}{" "}
                </h3>
              );
            }
          })()}
          <h3 className="content1">
            {this.state.voters[this.state.index].address}
            <br />
            {this.state.voters[this.state.index].city},{" "}
            {this.state.voters[this.state.index].state}{" "}
            {this.state.voters[this.state.index].zip}
          </h3>
          <img alt="hse" className="house_logo" src={house} />
        </div>
        <div className="item-e">
          <button className="reject" onClick={() => this.nextVoter()}>
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
