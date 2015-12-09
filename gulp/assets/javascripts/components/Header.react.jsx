var React = require('react');
var ReceiptStore = require('../stores/ReceiptStore.react.jsx');
var ReceiptActionCreators = require('../actions/ReceiptActionCreators.react.jsx');

var Header = React.createClass({
  render: function() {
    return (
      <header>
        <div className="container">
          <Logo />
          <Statistics />
        </div>
      </header>
    );
  }
});

var Logo = React.createClass({
  render: function() {
    return (
      <div className="logo icon-logo">
        <span>Money</span>
        <span className="light">Control</span>
      </div>
    );
  }
});

var Statistics = React.createClass({
  getInitialState: function() {
    return {
      statistics: {
        spendThisMonth: 0,
        totalSpend: 0,
        averageAmount: 0
      }
    };
  },

  componentDidMount: function() {
    ReceiptStore.addChangeListener(this._onChange);
    ReceiptActionCreators.loadReceipts();
  },

  componentWillUnmount: function() {
    ReceiptStore.removeChangeListener(this._onChange);
  },

  _onChange: function() {
    var stats = ReceiptStore.getAllReceipts().stats

    this.setState({
      statistics: stats,
      errors: ReceiptStore.getErrors(),
    });
  },

  render: function() {
    return (
      <div className="statistics">
        <div className="stat">
          <div className="title">Spend this month</div>
          <div className="amount">&euro; {this.state.statistics.spendThisMonth}</div>
        </div>
      </div>
    );
  }
});

module.exports = Header;
