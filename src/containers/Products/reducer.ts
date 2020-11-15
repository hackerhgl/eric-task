import { Map, fromJS } from 'immutable';

import { ProductAction, ProductStateMap } from './types';
import * as actions from './constants';

const initialState = Map<ProductStateMap>({
  fetching: false,
  error: false,
  data: [],
  combos: [],
});

function ProductReducer(state = initialState, action: ProductAction): Map<string, ProductStateMap> {
  switch (action.type) {
    case actions.FETCH:
      return state.set('fetching', true).set('error', false);
    case actions.FETCH_SUCCESS:
      return state
        .set('fetching', false)
        .set('data', fromJS(action.products))
        .set('combos', fromJS(action.combos));
    case actions.FETCH_FAILED:
      return state.set('fetching', false).set('error', true);
    default:
      return state;
  }
}

export default ProductReducer;
