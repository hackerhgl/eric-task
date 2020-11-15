import { ProductCombo, ProductComboRaw } from './types';

export function parseCombos(combos: ProductComboRaw[]): ProductCombo[] {
  const parsedList: ProductCombo[] = [];
  combos.forEach((rawCombo) => {
    const parsedCombo: ProductCombo = {
      id: rawCombo.id,
      combo: {},
    };
    rawCombo.combo.forEach((c) => {
      parsedCombo.combo[c.categoryId] = c.productId;
    });
    parsedList.push(parsedCombo);
  });
  return parsedList;
}
