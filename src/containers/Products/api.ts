import { AxiosResponse } from 'axios';
import api from 'libs/api';
import { Product } from './types';

export const fetch = async (): Promise<AxiosResponse<Product[]>> => {
  const resp = await api.get('/products.json');
  return resp.data;
};

export const fetchDeals = async (): Promise<AxiosResponse> => {
  const resp = await api.get('/deals.json');
  return resp.data;
};
