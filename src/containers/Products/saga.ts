import { takeLatest, call, put } from 'redux-saga/effects';

import * as constants from './constants';
import * as actions from './actions';
import * as api from './api';
import { Product, ProductCombo, ProductComboRaw } from './types';
import { parseCombos } from './utils';

const fetchSaga = function* fetchSaga() {
  try {
    const products: Product[] = yield call(api.fetch);
    const rawCombos: ProductComboRaw[] = yield call(api.fetchDeals);
    const parsedCombos: ProductCombo[] = parseCombos(rawCombos);

    yield put(actions.fetchSuccess(products, parsedCombos));
  } catch (e) {
    yield put(actions.fetchFailed());
  }
};

function* defaultProductSaga(): Generator {
  yield takeLatest(constants.FETCH, fetchSaga);
}

export default defaultProductSaga;
