import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
// TODO: add these imports to any file you wish to make a GraphQL query in
//========================================================================
// import ApolloClient from "apollo-boost";
// import { ApolloProvider } from "react-apollo";
// import gql from "graphql-tag";
//========================================================================

ReactDOM.render(<App />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister();

// TODO: - create a ApolloClient in any file you wish to make a GraphQL query in.
//       - test queries in the GraphQL UI Playground => localhost:3000/graphiql
//========================================================================
// GraphQL Example
//========================================================================

// const client = new ApolloClient ({
//   uri: "http://localhost:3000/graphql"
// });

// EXAMPLE QUERY WITH PARSING
// client.query({query: gql `{
//   voterByPrecinct(id:"10316") {
//     id,
//     szNameFirst}
//   }`
// }).then(result => console.log(result.data.voterByPrecinct[0].szNameFirst))
//
// client.query({query: gql `{
//   allVoters {
//     id,
//     szNameFirst,
//   szNameLast}
//   }`
// }).then(result => console.log(result))
