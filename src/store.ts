import { createStore, applyMiddleware, compose, Store } from 'redux';
import { routerMiddleware } from 'connected-react-router';
import createSagaMiddleware from 'redux-saga';

import history from 'libs/history';

import createReducer from 'reducers';
import defaultCategorySaga from 'containers/Categories/saga';

export default function configureStore(): Store {
  const sagaMiddleware = createSagaMiddleware();

  const middlewares = [sagaMiddleware, routerMiddleware(history)];
  const enhancers = [applyMiddleware(...middlewares)];
  const state = createReducer();

  const store = createStore(state, compose(...enhancers));
  sagaMiddleware.run(defaultCategorySaga);

  return store;
}
