Header = React.createClass
  render: ->
    `<header>
      <div className="container">
        <Logo />
        <Statistics initialStatistics={ this.props.statistics } />
      </div>
    </header>`

Logo = React.createClass
  render: ->
    `<div className="logo icon-logo">
      <span>Money</span>
      <span className="light">Control</span>
    </div>`

Statistics = React.createClass
  getInitialState: ->
    { statistics: @props.initialStatistics }

  render: ->
    statistics = @state.statistics.map((statistic) ->
      `<StatisticsItem key={statistic.id} statistic={statistic} />`
    )

    `<div className="statistics">
      {statistics}
    </div>`

StatisticsItem = React.createClass
  render: ->
    statistic = this.props.statistic
    `<div className="stat">
      <div className="title">{statistic.title}</div>
      <div className="amount">&euro; {statistic.euros},{statistic.cents}</div>
    </div>`

window.Header = Header
