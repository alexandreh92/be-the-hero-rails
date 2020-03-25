import React from 'react';
import { Switch, Route } from 'react-router-dom';

import SignIn from '~/pages/Auth/SignIn';
import SignUp from '~/pages/Auth/SignUp';

export default function Routes() {
  return (
    <Switch>
      <Route path="/" exact component={SignIn} />
      <Route path="/sign_in" isGuest exact component={SignIn} />
      <Route path="/sign_up" isGuest component={SignUp} />
    </Switch>
  );
}
