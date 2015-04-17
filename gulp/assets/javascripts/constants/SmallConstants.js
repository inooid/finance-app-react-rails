var keyMirror = require('keymirror');

var APIRoot = "http://localhost:3000/api";

module.exports = {

  APIEndpoints: {
    RECEIPTS:          APIRoot + "/v1/receipts"
    // LOGIN:          APIRoot + "/v1/login",
    // REGISTRATION:   APIRoot + "/v1/users",
    // STORIES:        APIRoot + "/v1/stories"
  },

  PayloadSources: keyMirror({
    SERVER_ACTION: null,
    VIEW_ACTION: null
  }),

  ActionTypes: keyMirror({
    // Session
    LOGIN_REQUEST: null,
    LOGIN_RESPONSE: null,

    // Routes
    REDIRECT: null,

    LOAD_RECEIPTS: null,
    RECEIVE_RECEIPTS: null,
    LOAD_RECEIPT: null,
    RECEIVE_RECEIPT: null,
    CREATE_RECEIPT: null,
    RECEIVE_CREATED_RECEIPT: null
  })

};
