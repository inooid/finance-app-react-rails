var React = require('react');
var WebAPIUtils = require('../utils/WebAPIUtils.js');
var ReceiptStore = require('../stores/ReceiptStore.react.jsx');
// var ErrorNotice = require('../components/common/ErrorNotice.react.jsx');
var ReceiptActionCreators = require('../actions/ReceiptActionCreators.react.jsx');
var moment = require('moment');
var Router = require('react-router');
var Link = Router.Link;

var ReceiptPage = React.createClass({

  getInitialState: function() {
    return {
      receipts: ReceiptStore.getAllReceipts(),
      errors: []
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
    this.setState({
      receipts: ReceiptStore.getAllReceipts(),
      errors: ReceiptStore.getErrors()
    });
  },

  render: function() {
    console.log(this.state)
    return (
      <div>
        <div className="row">
          <ReceiptsList receipts={this.state.receipts} />
        </div>
      </div>
    );
  }
});

var ReceiptItem = React.createClass({
  render: function() {
    var thisReceipt = this.props.receipt;
    var thisDate = moment(thisReceipt.date)

    return (
      <li className="receipt">
        <div className="receipt__body">&euro;{thisReceipt.euros},{thisReceipt.cents} <span className="receipt__date"> - { thisDate.format("dddd, MMMM Do YYYY, h:mm:ss a") }</span></div>
      </li>
      );
  }
});

var ReceiptsList = React.createClass({
  render: function() {
    return (
      <ul className="large-8 medium-10 small-12 small-centered columns">
        {this.props.receipts.map(function(receipt, index){
          return <ReceiptItem receipt={receipt} key={"receipt-" + index}/>
        })}
      </ul>
    );
  }
});

module.exports = ReceiptPage;
