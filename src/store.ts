import { createStore, applyMiddleware, compose } from 'redux';
import { routerMiddleware } from 'connected-react-router';

import history from './libs/history'

import createReducer from './reducers';

export default function configureStore() {
  const middlewares = [routerMiddleware(history)];
  const enhancers = [applyMiddleware(...middlewares)];
  const state = createReducer();
  
  const store = createStore(state, compose(...enhancers));
  
  return store;
}
