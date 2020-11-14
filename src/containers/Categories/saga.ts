import { takeLatest, call, put } from 'redux-saga/effects';

import * as constants from './constants';
import * as actions from './actions';
import * as api from './api';
import { Category } from "./types";

const fetchSaga = function* fetchSaga(p:any) {
  try {
    const data = yield call(api.fetch);
    
    yield put(actions.fetchSuccess(data as Category[]));
  } catch (e) {
    yield put(actions.fetchFailed());
  }
};

let didRun = false;
function* defaultCategorySaga() {
  if (didRun) {
    return;
  }
  didRun = true;
  yield takeLatest(constants.FETCH, fetchSaga);
};

export default defaultCategorySaga;
