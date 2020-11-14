import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';

import configureStore from './store';
import WebApp from './app';

const store = configureStore();

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <WebApp />
    </Provider>
  </React.StrictMode>,
  document.getElementById('root'),
);
