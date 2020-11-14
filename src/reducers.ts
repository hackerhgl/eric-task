import { connectRouter } from 'connected-react-router/immutable';
import { combineReducers } from 'redux-immutable';
import { Reducer } from 'redux';

import history from './libs/history';

import categories from './containers/Categories/reducer';

function createReducer(injectedReducers = {}): Reducer {
  return combineReducers({
    categories,
    router: connectRouter(history),
    ...injectedReducers,
  });
}

export default createReducer;
