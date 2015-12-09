var React = require('react');
var RouteHandler = require('react-router').RouteHandler;
var Header = require('../components/Header.react.jsx');
var RouteStore = require('../stores/RouteStore.react.jsx');

var FinanceApp = React.createClass({
  render: function() {
    return (
      <div className="app">
        <Header />
        <RouteHandler />
      </div>
    );
  }

});

module.exports = FinanceApp;
