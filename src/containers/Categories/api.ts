import { AxiosResponse } from 'axios';
import api from '../../libs/api';

export const fetch = async (): Promise<AxiosResponse> => {
  const resp = await api.get('/categories.json');
  return resp.data;
};
