var Post = React.createClass({
  displayName: 'Post',
  propTypes: {
    title: React.PropTypes.string,
    body: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Body: {this.props.body}</div>
      </div>
    );
  }
});
