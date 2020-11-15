export interface Product {
  id: number;
  label: string;
  categoryId: number;
}

export type ProductCombo = number[];

export interface ProductState {
  fetching: boolean;
  error: boolean;
  data: Product[];
  combos: ProductCombo[];
}

export type ProductStateMap = boolean | Product[] | ProductCombo[];

export interface ProductAction {
  type: string;
  products?: Product[];
  combos?: ProductCombo[];
}

export interface ProductHook extends ProductState {
  fetch: () => ProductAction;
}
