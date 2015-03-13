Graph = React.createClass
  getInitialState: ->
    {
      title: @props.title
      graphData: @props.graphData
    }

  render: ->
    `<div className="graph">
      <div className="title">
        <h1>{ this.state.title }</h1>
        <GraphSorter />
      </div>
      <div className="chartist">
        <p>hoi</p>
      </div>
    </div>`

GraphSorter = React.createClass
  getInitialState: ->
    {
      active: 2
    }

  render: ->
    `<div className="graph-sorter">
      <div className="graph-sorter-title">Sort by:</div>
      <ul>
        <li id="0" className={this.state.active == 0 ? 'active' : '' }>Day</li>
        <li id="1" className={this.state.active == 1 ? 'active' : '' }>Month</li>
        <li id="2" className={this.state.active == 2 ? 'active' : '' }>Year</li>
      </ul>
    </div>`

window.Graph = Graph
