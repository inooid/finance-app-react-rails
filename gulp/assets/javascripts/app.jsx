var React = require('react');
require('./components/header.jsx');
require('./components/graph.jsx');

var statistics = [
  {
    id: 1,
    title: 'Spend this month:',
    euros: 76,
    cents: 58
  }, {
    id: 2,
    title: 'Average amount:',
    euros: 4,
    cents: 56
  }, {
    id: 3,
    title: 'Total spend:',
    euros: 189,
    cents: 94
  }
];

function render() {
  return (
    <div>
      <header>
        <Header statistics={statistics} />
      </header>
      <div className="app-content container">
        <Graph title={statistics[0].title} data={[0,1,2,3,4,5]} />
      </div>
    </div>
  );
}

module.exports = render
