import { connectRouter } from 'connected-react-router/immutable';
import { combineReducers } from 'redux-immutable';
import { Reducer } from 'redux';

import categories from 'containers/Categories/reducer';
import products from 'containers/Products/reducer';
import history from 'libs/history';

function createReducer(injectedReducers = {}): Reducer {
  return combineReducers({
    products,
    categories,
    router: connectRouter(history),
    ...injectedReducers,
  });
}

export default createReducer;
