var React = require('react');
var WebAPIUtils = require('../utils/WebAPIUtils.js');
var ReceiptStore = require('../stores/ReceiptStore.react.jsx');
// var ErrorNotice = require('../components/common/ErrorNotice.react.jsx');
var ReceiptActionCreators = require('../actions/ReceiptActionCreators.react.jsx');
var Chartist = require('chartist');
var moment = require('moment');
var Router = require('react-router');
var Link = Router.Link;

var DashboardPage = React.createClass({

  getInitialState: function() {
    return {
      receipts: ReceiptStore.getAllReceipts(),
      errors: [],
      graphData: {
        labels: [],
        series: []
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
    var receipts = ReceiptStore.getAllReceipts().receipts
    var dataForChart = this._formatDataForChart(receipts)

    this.setState({
      receipts: receipts,
      errors: ReceiptStore.getErrors(),
      graphData: dataForChart
    });

    if(dataForChart.series.length > 0) {
      new Chartist.Line('.ct-chart', dataForChart, {showArea: true, height: 300})
    }

  },

  _formatDataForChart: function(receipts) {
    var labels = [];
    var series = [];

    receipts.forEach(function(obj) {
      labels.push(
        moment(obj.date).format("DD-MM-YYYY")
      );
      series.push(obj.amount);
    });

    return {
      labels: labels,
      series: [series]
    };
  },

  render: function() {
    return (
      <div className="container">
        <div className="ct-chart"></div>
      </div>
    );
  }
});

// <ReceiptsList receipts={this.state.receipts} />
// var ReceiptRow = React.createClass({
//   render: function() {
//     var thisReceipt = this.props.receipt;
//     var date = moment(thisReceipt.date).format("hh:mm Do of MMMM YYYY")

//     return (
//       <tr className="receipt">
//         <td className="receipt__id">{thisReceipt.id}</td>
//         <td className="receipt__amount">&euro;{thisReceipt.amount}</td>
//         <td className="receipt__date">{date}</td>
//       </tr>
//       );
//   }
// });

// var ReceiptsList = React.createClass({
//   render: function() {
//     return (
//       <table width="100%">
//         <thead>
//           <tr>
//             <td>#</td>
//             <td>Amount:</td>
//             <td>Date:</td>
//           </tr>
//         </thead>
//         <tbody>
//           {this.props.receipts.map(function(receipt, index){
//             return <ReceiptRow receipt={receipt} key={"receipt-" + index}/>
//           })}
//         </tbody>
//       </table>
//     );
//   }
// });

module.exports = DashboardPage;
