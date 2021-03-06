import { combineReducers } from 'redux';

import { reducer as toastr } from 'react-redux-toastr';
import { reducer as auth } from './auth';
import { reducer as user } from './user';

export default combineReducers({
  auth,
  user,
  toastr,
});
