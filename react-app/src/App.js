import React, { Component } from "react";
import "./App.css";
import Canvas from "./Components/Canvas";
import Login from "./Components/Login";
import { Route, Switch } from "react-router-dom";
import { ProtectedRoute } from "./Components/ProtectedRoute";
import Error404 from "./Components/Error404";

class App extends Component {
  render() {
    return (
      <div className="App">
        <Switch>
          <ProtectedRoute exact path="/" component={Canvas} />
          <Route exact path="/login" component={Login} />
          <Route path="*" component={Error404}/>
        </Switch>
      </div>
    );
  }
}

export default App;
