var React = require('react');
var RouteHandler = require('react-router').RouteHandler;
var Header = require('../components/Header.react.jsx');
var RouteStore = require('../stores/RouteStore.react.jsx');
var ReceiptStore = require('../stores/ReceiptStore.react.jsx');

function getStateFromStores() {
  return {
    statistics: ReceiptStore.getAllReceipts()
  };
}

var FinanceApp = React.createClass({
  getInitialState: function() {
    return getStateFromStores();
  },

  render: function() {
    return (
      <div className="app">
        <Header statistics={this.state.statistics} />
        <RouteHandler />
      </div>
    );
  }

});

module.exports = FinanceApp;
