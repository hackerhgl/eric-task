import { createStore, applyMiddleware, compose } from 'redux';
import { routerMiddleware } from 'connected-react-router/immutable';

import history from './libs/history'

import createReducer from './reducers';

export default function configureStore() {
  const middlewares = [routerMiddleware(history)];
  const enhancers = [applyMiddleware(...middlewares)];
  const store = createStore(createReducer(), compose(...enhancers));

  return store;
}
