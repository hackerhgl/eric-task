import { connectRouter } from 'connected-react-router';
import { combineReducers } from 'redux';

import history from './libs/history';

import categories from './containers/Categories/reducer'

function createReducer(injectedReducers = {}) {
  return combineReducers({
    categories,
    router: connectRouter(history),
    ...injectedReducers,
  });
}

export default createReducer;