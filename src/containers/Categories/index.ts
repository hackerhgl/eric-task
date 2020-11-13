import { useSelector, useDispatch } from 'react-redux';
import {Map}  from 'immutable';
import { createSelector } from 'reselect';

import * as actions from './actions';
import { CategoryState, CategoryStateMap } from './types';


const selector = createSelector(
  (state: Map<string, any>): Map<string, CategoryStateMap> => state.get('categories'),
  (sub) => sub.toJS(),
);

export function useCategories() {
  const state = useSelector(selector) as CategoryState;
  const dispatch = useDispatch();  

  return {
    ...state,
    fetch: () => dispatch(actions.fetch()),
  };
}

export default useCategories;
