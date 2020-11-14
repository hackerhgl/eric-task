import { takeLatest, call, put } from 'redux-saga/effects';

import * as constants from './constants';
import * as actions from './actions';
import * as api from './api';

const fetchSaga = function* fetchSaga() {
  try {
    const data = yield call(api.fetch);
    yield put(actions.fetchSuccess(data));
  } catch (e) {
    yield put(actions.fetchFailed());
  }
};

function* defaultProductSaga(): Generator {
  yield takeLatest(constants.FETCH, fetchSaga);
}

export default defaultProductSaga;
