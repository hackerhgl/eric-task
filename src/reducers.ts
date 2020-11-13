import { connectRouter } from 'connected-react-router/immutable';
import { combineReducers } from 'redux-immutable';

import history from './libs/history';

import categories from './containers/Categories/reducer'

export default function createReducer(injectedReducers = {}) {
  const rootReducer = combineReducers({
    router: connectRouter(history),
    categories,
    ...injectedReducers,
  });

  return rootReducer;
}
