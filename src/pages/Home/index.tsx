import React, { useEffect } from 'react';

import useCategories from 'containers/Categories';
import useProducts from 'containers/Products';

export default function HomePage(): JSX.Element {
  const categories = useCategories();
  const products = useProducts();

  useEffect(() => {
    categories.fetch();
    products.fetch();
  }, []);

  console.log(categories);

  return <h1>HomePage</h1>;
}
