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
  space: {
    padding: theme.spacing(2),
  },
}));

function arrayMatch(source: number[], target: number[], productId: number) {
  // eslint-disable-next-line
  for (const val of source) {
    if (target.indexOf(productId) === -1 || target.indexOf(val) === -1) {
      return false;
    }
  }
  return true;
}

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

  const comboValues = Object.values(combo)
    .filter((v) => !!v)
    .map(Number);

  function productsFilter(product: Product) {
    let allow = false;

    if (comboValues.length) {
      products.combos.forEach((pCombo) => {
        if (comboValues.length === 1 && combo[product.categoryId] === comboValues[0]) {
          allow = true;
          return;
        }
        const check = arrayMatch(comboValues, pCombo, product.id);
        if (check) {
          allow = true;
        }
      });
    } else {
      allow = true;
    }

    const checkCat = product.categoryId === activeCategory;

    return checkCat && allow;
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
      {comboValues.length ? (
        <Paper className={styles.paper} elevation={3}>
          <Typography variant="h5" className={styles.space}>
            Selected Combo
          </Typography>
          <Divider />
          <Typography className={styles.space}>
            {comboValues
              .map((paroductId) => products.data.find((v) => v.id === paroductId)?.label)
              .join(', ')}
          </Typography>
        </Paper>
      ) : null}
    </Container>
  );
}
