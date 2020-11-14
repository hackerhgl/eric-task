export interface Product {
  id: number;
  label: string;
  categoryId: number;
}

export interface ProductState {
  fetching: boolean;
  error: boolean;
  data: Product[] | undefined;
}

export type ProductStateMap = boolean | Product[] | undefined;

export interface ProductAction {
  type: string;
  payload?: Product[];
}

export interface ProductHook extends ProductState {
  fetch: () => ProductAction;
}
