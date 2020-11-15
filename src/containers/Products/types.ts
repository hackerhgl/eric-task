export interface Product {
  id: number;
  label: string;
  categoryId: number;
}

export interface ProductCombo {
  id: number;
  combo: {
    [id: number]: number;
  };
}

export interface ProductComboRaw {
  id: number;
  combo: [
    {
      categoryId: number;
      productId: number;
    },
  ];
}

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
