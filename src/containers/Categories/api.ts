import api from '../../libs/api';

export const fetch = async () => {
    try {
        const resp = await api.get('/categories.json');
        return resp.data;
    } catch (error) {
        throw error;        
    }
}