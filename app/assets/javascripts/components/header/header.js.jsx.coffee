Header = React.createClass
  render: ->
    `<header>
      <div className="container">
        <Logo />
      </div>
    </header>`

Logo = React.createClass
  render: ->
    `<div className="logo icon-logo">
      <span>Money</span>
      <span className="light">Control</span>
    </div>`

window.Header = Header
