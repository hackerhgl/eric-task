import React, { useEffect, useState } from 'react';

import { makeStyles } from '@material-ui/core/styles';
import ButtonBase from '@material-ui/core/ButtonBase';
import Typography from '@material-ui/core/Typography';
import Container from '@material-ui/core/Container';
import Divider from '@material-ui/core/Divider';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';

import ListItemText from '@material-ui/core/ListItemText';
import ListItem from '@material-ui/core/ListItem';
import List from '@material-ui/core/List';

import useCategories from 'containers/Categories';
import useProducts from 'containers/Products';
import { Product } from 'containers/Products/types';
import { SelectedCombo } from './types';

const useStyles = makeStyles((theme) => ({
  paper: {
    marginTop: theme.spacing(2),
  },
  categoryBase: {
    width: '100%',
  },
  categoryBaseActive: {
    background: theme.palette.text.primary,
    color: theme.palette.background.default,
  },
  categoryText: {
    textAlign: 'center',
    padding: theme.spacing(2),
  },
}));

export default function HomePage(): JSX.Element {
  const categories = useCategories();
  const products = useProducts();
  const styles = useStyles();

  const [activeCategory, setCategory] = useState(1);
  const [combo, setComboState] = useState<SelectedCombo>({});

  function setCombo(productId: number) {
    const selected = combo[activeCategory] === productId;
    setComboState({ ...combo, [activeCategory]: !selected ? productId : null });
  }

  function productsFilter(product: Product) {
    const checkCat = product.categoryId === activeCategory;
    return checkCat;
  }

  useEffect(() => {
    categories.fetch();
    products.fetch();
  }, []);

  if (categories.fetching || products.fetching) {
    return <h1>Loading</h1>;
  }

  return (
    <Container maxWidth="md">
      <Typography variant="h4">Online store</Typography>
      <Paper className={styles.paper} elevation={3}>
        <Grid container>
          {categories.data?.map((category) => (
            <Grid item key={category.id.toString()} xs={4}>
              <ButtonBase
                onClick={() => setCategory(category.id)}
                className={`${styles.categoryBase} ${
                  category.id === activeCategory ? styles.categoryBaseActive : ''
                }`}
              >
                <Typography className={`${styles.categoryText}`} variant="h6">
                  {category.label}
                </Typography>
              </ButtonBase>
            </Grid>
          ))}
        </Grid>
        <Divider />
        <List>
          {products.data?.filter(productsFilter).map((product) => (
            <ListItem
              button
              key={product.id.toString()}
              onClick={() => setCombo(product.id)}
              selected={combo[activeCategory] === product.id}
            >
              <Container>
                <ListItemText>{product.label}</ListItemText>
              </Container>
            </ListItem>
          ))}
        </List>
      </Paper>
    </Container>
  );
}
