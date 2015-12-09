var FinanceAppDispatcher = require('../dispatcher/FinanceAppDispatcher.js');
var SmallConstants = require('../constants/SmallConstants.js');
var EventEmitter = require('events').EventEmitter;
var assign = require('object-assign');

var ActionTypes = SmallConstants.ActionTypes;
var CHANGE_EVENT = 'change';

var _receipts = { stats: {}, receipts: [] };
var _errors = [];
var _receipt = { id: 0, amount: '', date: '' };

var ReceiptStore = assign({}, EventEmitter.prototype, {
  emitChange: function() {
    this.emit(CHANGE_EVENT);
  },

  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback);
  },

  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback);
  },

  getAllReceipts: function() {
    return _receipts;
  },

  getAllStatistics: function() {
    return _receipts.stats;
  },

  getReceipt: function() {
    return _receipt;
  },

  getErrors: function() {
    return _errors;
  }
});

ReceiptStore.dispatchToken = FinanceAppDispatcher.register(function(payload) {
  var action = payload.action;

  switch(action.type) {

    case ActionTypes.RECEIVE_RECEIPTS:
      _receipts = action.json;
      ReceiptStore.emitChange();
      break;

    // case ActionTypes.RECEIVE_CREATED_RECEIPT:
    //   if (action.json) {
    //     _receipts.unshift(action.json.receipt);
    //     _errors = [];
    //   }
    //   if (action.errors) {
    //     _errors = action.errors;
    //   }
    //   ReceiptStore.emitChange();
    //   break;

    // case ActionTypes.RECEIVE_RECEIPT:
    //   if (action.json) {
    //     _receipt = action.json.receipt;
    //     _errors = [];
    //   }
    //   if (action.errors) {
    //     _errors = action.errors;
    //   }
    //   ReceiptStore.emitChange();
    //   break;
  }
  return true;
});

module.exports = ReceiptStore;
