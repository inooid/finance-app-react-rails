var React = require('react');

var Graph = React.createClass({
  getInitialState: function() {
    return {
      title: this.props.title,
      graphData: this.props.graphData
    };
  },
  render: function() {
    return (
      <div className="graph">
        <div className="title">
          <h1>{ this.state.title }</h1>
          <GraphSorter />
        </div>
        <div className="chartist">
          <p>hoi</p>
        </div>
      </div>
    );
  }
});

var GraphSorter = React.createClass({
  getInitialState: function() {
    return {
      active: 2
    };
  },
  render: function() {
    return (
      <div className="graph-sorter">
        <div className="graph-sorter-title">Sort by:</div>
        <ul>
          <li id="0" className={this.state.active == 0 ? 'active' : '' }>Day</li>
          <li id="1" className={this.state.active == 1 ? 'active' : '' }>Month</li>
          <li id="2" className={this.state.active == 2 ? 'active' : '' }>Year</li>
        </ul>
      </div>
    );
  }
});

window.Graph = Graph;
