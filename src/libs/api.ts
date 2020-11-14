import axios from 'axios';
import { API } from '../configs';

const instance = axios.create({
  baseURL: API,
});

export default instance;
