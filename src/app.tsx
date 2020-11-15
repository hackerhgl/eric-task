import React from 'react';
import { ConnectedRouter } from 'connected-react-router/immutable';
import { Route, Switch } from 'react-router-dom';

import history from 'libs/history';
import HomePage from 'pages/Home';

function WebApp(): JSX.Element {
  return (
    <ConnectedRouter history={history}>
      <Switch>
        <Route path="/" exact component={HomePage} />
      </Switch>
    </ConnectedRouter>
  );
}

export default WebApp;
