import { takeLatest, call, put } from 'redux-saga/effects';

import { Product, ProductCombo } from './types';
import * as constants from './constants';
import * as actions from './actions';
import * as api from './api';

const fetchSaga = function* fetchSaga() {
  try {
    const products: Product[] = yield call(api.fetch);
    const productCombos: ProductCombo[] = yield call(api.fetchDeals);

    yield put(actions.fetchSuccess(products, productCombos));
  } catch (e) {
    yield put(actions.fetchFailed());
  }
};

function* defaultProductSaga(): Generator {
  yield takeLatest(constants.FETCH, fetchSaga);
}

export default defaultProductSaga;
