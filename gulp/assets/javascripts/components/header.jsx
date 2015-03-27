var React = require('react');

var Header = React.createClass({
  render: function() {
    return (
      <div className="container">
        <Logo />
        <Statistics initialStatistics={ this.props.statistics } />
      </div>
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
      statistics: this.props.initialStatistics
    };
  },

  render: function() {
    var statistics = this.state.statistics.map(function(statistic) {
      return (
        <StatisticsItem key={statistic.id} statistic={statistic} />
      );
    });
    return (
      <div className="statistics">
        {statistics}
      </div>
    );
  }
});

var StatisticsItem = React.createClass({
  render: function() {
    var statistic = this.props.statistic;

    return (
      <div className="stat">
        <div className="title">{statistic.title}</div>
        <div className="amount">&euro; {statistic.euros},{statistic.cents}</div>
      </div>
    );
  }
});

window.Header = Header;
