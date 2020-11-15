import { Product, ProductAction, ProductCombo } from './types';
import * as constants from './constants';

export const fetch = (): ProductAction => ({
  type: constants.FETCH,
});

export const fetchSuccess = (products?: Product[], combos?: ProductCombo[]): ProductAction => ({
  type: constants.FETCH_SUCCESS,
  products,
  combos,
});

export const fetchFailed = (): ProductAction => ({
  type: constants.FETCH_FAILED,
});
