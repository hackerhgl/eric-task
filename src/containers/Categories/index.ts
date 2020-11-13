import { useSelector, useDispatch } from 'react-redux';
import { createSelector } from 'reselect';

import * as actions from './actions';
import {  CategoryState } from './types';

interface SelectorProps {
  categories: CategoryState,
}

const selector = createSelector(
  (state: SelectorProps) => state,
  (sub) => sub.categories,
);

export function useCategories() {
  const state = useSelector(selector);
  const dispatch = useDispatch();

  return {
    ...state,
    fetch: () => dispatch(actions.fetch()),
  };
}

export default useCategories;
