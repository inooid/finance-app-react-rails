var FinanceAppDispatcher = require('../dispatcher/FinanceAppDispatcher.js');
var SmallConstants = require('../constants/SmallConstants.js');
// var SessionStore = require('../stores/SessionStore.react.jsx');
var ReceiptStore = require('../stores/ReceiptStore.react.jsx');
var EventEmitter = require('events').EventEmitter;
var assign = require('object-assign');

var Router = require('react-router');
var routes = require('../routes.jsx');

var router = Router.create({
  routes: routes,
  location: null // Router.HistoryLocation
});

var ActionTypes = SmallConstants.ActionTypes;
var CHANGE_EVENT = 'change';

var RouteStore = assign({}, EventEmitter.prototype, {

  emitChange: function() {
    this.emit(CHANGE_EVENT);
  },

  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback);
  },

  removeChangeListener: function() {
    this.removeListener(CHANGE_EVENT, callback);
  },

  getRouter: function() {
    return router;
  },

  redirectHome: function() {
    router.transitionTo('app');
  }
});

RouteStore.dispatchToken = FinanceAppDispatcher.register(function(payload) {
  FinanceAppDispatcher.waitFor([
    ReceiptStore.dispatchToken
  ]);

  var action = payload.action;

  switch(action.type) {

    case ActionTypes.REDIRECT:
      router.transitionTo(action.route);
      break;

    case ActionTypes.LOGIN_RESPONSE:
      if (SessionStore.isLoggedIn()) {
        router.transitionTo('app');
        // Dirty hack, need to figure this out
        $(document).foundation();
      }
      break;

    case ActionTypes.RECEIVE_CREATED_STORY:
      router.transitionTo('app');
      break;

    default:
  }

  return true;
});

module.exports = RouteStore;
