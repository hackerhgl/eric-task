import React, { useEffect } from 'react'
import useCategories from '../../containers/Categories';

export default function HomePage() {
    const categories = useCategories();

    useEffect(() => {
        categories.fetch();
    }, []);

    return <h1>HomePage</h1>;
}