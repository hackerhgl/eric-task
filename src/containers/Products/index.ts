import { useSelector, useDispatch } from 'react-redux';
import { createSelector } from 'reselect';
import { Map } from 'immutable';

import { ProductHook, ProductState, ProductStateMap } from './types';
import * as actions from './actions';

const selector = createSelector(
  // eslint-disable-next-line
  (state: Map<string, any>): Map<string, ProductStateMap> => state.get('products'),
  (sub): ProductState => sub.toJS() as ProductState,
);

export default function useProducts(): ProductHook {
  const state = useSelector(selector);
  const dispatch = useDispatch();

  return {
    ...state,
    fetch: () => dispatch(actions.fetch()),
  };
}
