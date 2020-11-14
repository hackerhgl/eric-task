import { useSelector, useDispatch } from 'react-redux';
import { createSelector } from 'reselect';
import { Map } from 'immutable';

import { CategoryHook, CategoryState, CategoryStateMap } from './types';
import * as actions from './actions';

const selector = createSelector(
  // eslint-disable-next-line
  (state: Map<string, any>): Map<string, CategoryStateMap> => state.get('categories'),
  (sub): CategoryState => sub.toJS() as CategoryState,
);

export default function useCategories(): CategoryHook {
  const state = useSelector(selector);
  const dispatch = useDispatch();

  return {
    ...state,
    fetch: () => dispatch(actions.fetch()),
  };
}
