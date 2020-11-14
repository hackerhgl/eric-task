export interface Category {
  id: number;
  label: string;
}

export interface CategoryState {
  fetching: boolean;
  error: boolean;
  data: Category[] | undefined;
}

export type CategoryStateMap = boolean | Category[] | undefined;

export interface CategoryAction {
  type: string;
  payload?: Category[];
}

export interface CategoryHook extends CategoryState {
  fetch: () => CategoryAction;
}
