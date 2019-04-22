import React, { Component } from "react";
import "./App.css";
import Canvas from "./Components/Canvas";
import Login from "./Components/Login";
import { Route, Switch } from "react-router-dom";
import { ProtectedRoute } from "./Components/ProtectedRoute";

class App extends Component {
  render() {
    return (
      <div className="App">
        <Switch>
          <ProtectedRoute exact path="/" component={Canvas} />
          <Route exact path="/login" component={Login} />
          <Route path="*" component={()=>"404 NOT FOUND"}/>
        </Switch>
      </div>
    );
  }
}

export default App;
