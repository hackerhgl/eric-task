import { Category, CategoryAction } from './types';
import * as constants from './constants';

export const fetch = (): CategoryAction => ({
  type: constants.FETCH,
});

export const fetchSuccess = (payload?: Category[]): CategoryAction => ({
  type: constants.FETCH_SUCCESS,
  payload,
});

export const fetchFailed = (): CategoryAction => ({
  type: constants.FETCH_FAILED,
});
