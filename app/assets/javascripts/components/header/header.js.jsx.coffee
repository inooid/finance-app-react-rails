Header = React.createClass
  render: ->
    `<header>
      <Logo />
    </header>`

Logo = React.createClass
  render: ->
    `<h1>MoneyControl</h1>`

window.Header = Header
