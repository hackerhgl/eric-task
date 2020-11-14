import { createStore, applyMiddleware, compose, Store } from 'redux';
import { routerMiddleware } from 'connected-react-router';
import createSagaMiddleware from 'redux-saga';

import categoriesSaga from 'containers/Categories/saga';
import productsSaga from 'containers/Products/saga';

import createReducer from 'reducers';
import history from 'libs/history';

export default function configureStore(): Store {
  const sagaMiddleware = createSagaMiddleware();

  const middlewares = [sagaMiddleware, routerMiddleware(history)];
  const enhancers = [applyMiddleware(...middlewares)];
  const state = createReducer();

  const store = createStore(state, compose(...enhancers));
  sagaMiddleware.run(categoriesSaga);
  sagaMiddleware.run(productsSaga);

  return store;
}
