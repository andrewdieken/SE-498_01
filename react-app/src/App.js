import React, { Component } from "react";
import "./App.css";
import Canvas from "./Components/Canvas";

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <Canvas />
        </header>
      </div>
    );
  }
}

export default App;
