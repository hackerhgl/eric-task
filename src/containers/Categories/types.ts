import { FETCH } from "./constants";

export interface Category {
    id: number;
    label: string;
}

export interface CategoryState {
    fetching: boolean;
    error: boolean;
    data: Category[] | undefined;
}


export interface CategoryAction {
    type: typeof FETCH;
    payload?: Category[];
}
