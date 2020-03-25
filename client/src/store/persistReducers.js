import storage from 'redux-persist/lib/storage';
import { persistReducer } from 'redux-persist';

export default reducers => {
  const persistedReducer = persistReducer(
    {
      key: 'beTheHeroWEB',
      storage,
      whitelist: ['auth', 'user', 'plansCart'],
    },
    reducers
  );

  return persistedReducer;
};
