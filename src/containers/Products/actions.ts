import { Product, ProductAction } from './types';
import * as constants from './constants';

export const fetch = (): ProductAction => ({
  type: constants.FETCH,
});

export const fetchSuccess = (payload?: Product[]): ProductAction => ({
  type: constants.FETCH_SUCCESS,
  payload,
});

export const fetchFailed = (): ProductAction => ({
  type: constants.FETCH_FAILED,
});
