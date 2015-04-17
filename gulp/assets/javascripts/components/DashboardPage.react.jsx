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
      <div className="container">
        <ReceiptsList receipts={this.state.receipts} />
      </div>
    );
  }
});

var ReceiptRow = React.createClass({
  render: function() {
    var thisReceipt = this.props.receipt;
    var date = moment(thisReceipt.date).format("hh:mm Do of MMMM YYYY")

    return (
      <tr className="receipt">
        <td className="receipt__id">{thisReceipt.id}</td>
        <td className="receipt__amount">&euro;{thisReceipt.amount}</td>
        <td className="receipt__date">{date}</td>
      </tr>
      );
  }
});

var ReceiptsList = React.createClass({
  render: function() {
    return (
      <table width="100%">
        <thead>
          <tr>
            <td>#</td>
            <td>Amount:</td>
            <td>Date:</td>
          </tr>
        </thead>
        <tbody>
          {this.props.receipts.map(function(receipt, index){
            return <ReceiptRow receipt={receipt} key={"receipt-" + index}/>
          })}
        </tbody>
      </table>
    );
  }
});

module.exports = ReceiptPage;
