import { CategoryAction, CategoryState } from "./types";
import * as actions from "./constants";

const initialState: CategoryState = {
    fetching: false,
    error: false,
    data: [],
};

function categoryReducer(state = initialState, action: CategoryAction): CategoryState {
    switch (action.type) {
        case actions.FETCH:
            return { ...state, fetching: true, error: false, };
        case actions.FETCH_SUCCESS:
            return { ...state, fetching: false, data: action.payload };
        case actions.FETCH_FAILED:
            return { ...state, fetching: false, error: true };
        default:
            return state;
    }
}

export default categoryReducer;