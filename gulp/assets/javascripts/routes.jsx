// routes.jsx
var React = require('react');
var Router = require('react-router');
var Route = Router.Route;
var DefaultRoute = Router.DefaultRoute;

var FinanceApp = require('./components/FinanceApp.react.jsx');
var DashboardPage = require('./components/DashboardPage.react.jsx');

module.exports = (
  <Route name="app" path="/" handler={FinanceApp}>
    <DefaultRoute handler={DashboardPage} />
  </Route>
);
