import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";
import gql from "graphql-tag";
import App from './App';
import * as serviceWorker from './serviceWorker';

ReactDOM.render(<App />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister();

const client = new ApolloClient ({
  uri: "http://localhost:3000/graphql"
});

// EXAMPLE QUERY WITH PARSING
// client.query({query: gql `{
//   voterByPrecinct(id:"10316") {
//     id,
//     szNameFirst}
//   }`
// }).then(result => console.log(result.data.voterByPrecinct[0].szNameFirst))

client.query({query: gql `{
  allVoters {
    id,
    szNameFirst,
  szNameLast}
  }`
}).then(result => console.log(result))
