var FinanceAppDispatcher = require('../dispatcher/FinanceAppDispatcher.js');
var SmallConstants = require('../constants/SmallConstants.js');
var WebAPIUtils = require('../utils/WebAPIUtils.js');

var ActionTypes = SmallConstants.ActionTypes;

module.exports = {

  loadReceipts: function() {
    FinanceAppDispatcher.handleViewAction({
      type: ActionTypes.LOAD_RECEIPTS
    });
    WebAPIUtils.loadReceipts();
  }

  // loadReceipt: function(storyId) {
  //   FinanceAppDispatcher.handleViewAction({
  //     type: ActionTypes.LOAD_RECEIPT,
  //     storyId: storyId
  //   });
  //   WebAPIUtils.loadReceipt(receiptId);
  // },

  // createReceipt: function(title, body) {
  //   FinanceAppDispatcher.handleViewAction({
  //     type: ActionTypes.CREATE_STORY,
  //     title: title,
  //     body: body
  //   });
  //   WebAPIUtils.createReceipt(title, body);
  // }

};
