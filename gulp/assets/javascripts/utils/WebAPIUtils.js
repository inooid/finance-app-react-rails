var ServerActionCreators = require('../actions/ServerActionCreators.react.jsx');
var SmallConstants = require('../constants/SmallConstants.js');
var request = require('superagent');

var APIEndpoints = SmallConstants.APIEndpoints;

module.exports = {

  loadReceipts: function() {
    request.get(APIEndpoints.RECEIPTS)
      .set('Accept', 'application/json')
      // .set('Authorization', sessionStorage.getItem('accessToken'))
      .end(function(error, res){
        if (res) {
          receipts = JSON.parse(res.text);
          ServerActionCreators.receiveReceipts(receipts);
        }
      });
  },
};
