import { Map } from 'immutable';

import { CategoryAction, CategoryStateMap } from './types';
import * as actions from './constants';

const initialState = Map<CategoryStateMap>({
  fetching: false,
  error: false,
  data: [],
});

function categoryReducer(
  state = initialState,
  action: CategoryAction,
): Map<string, CategoryStateMap> {
  switch (action.type) {
    case actions.FETCH:
      return state.set('fetching', true).set('error', false);
    case actions.FETCH_SUCCESS:
      return state.set('fetching', false).set('data', action.payload);
    case actions.FETCH_FAILED:
      return state.set('fetching', false).set('error', true);
    default:
      return state;
  }
}

export default categoryReducer;
