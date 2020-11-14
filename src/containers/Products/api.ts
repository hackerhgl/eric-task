import { AxiosResponse } from 'axios';
import api from 'libs/api';

export const fetch = async (): Promise<AxiosResponse> => {
  const resp = await api.get('/products.json');
  return resp.data;
};
