var FinanceAppDispatcher = require('../dispatcher/FinanceAppDispatcher.js');
var SmallConstants = require('../constants/SmallConstants.js');

var ActionTypes = SmallConstants.ActionTypes;

module.exports = {

  receiveReceipts: function(json) {
    FinanceAppDispatcher.handleServerAction({
      type: ActionTypes.RECEIVE_RECEIPTS,
      json: json
    });
  },

};
