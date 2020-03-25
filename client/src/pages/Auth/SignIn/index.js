import React from 'react';
import { useDispatch } from 'react-redux';
import * as Yup from 'yup';
import { mdiEmailOutline, mdiLockOutline } from '@mdi/js';

import AuthActions from '~/store/ducks/auth';

import Input from '~/components/Input';

import { AuthForm, Field, AuthLink, Button, RecoverLink } from './styles';

const schema = Yup.object().shape({
  email: Yup.string()
    .email('Insira um e-mail válido')
    .required('O e-mail é obrigatório'),
  password: Yup.string().required('A senha é obrigatória'),
});

export default function SignIn() {
  const dispatch = useDispatch();
  const { signInRequest } = AuthActions;

  function handleSubmit({ email, password }) {
    dispatch(signInRequest(email, password));
  }

  return (
    <AuthForm schema={schema} onSubmit={handleSubmit}>
      <Field>
        <Input
          label="Nome"
          name="email"
          type="email"
          icon={mdiEmailOutline}
          placeholder="Ex: robertasouza85@gmail.com"
        />
      </Field>
      <Field>
        <Input
          label="Senha"
          name="password"
          type="password"
          icon={mdiLockOutline}
          placeholder="Sua senha"
        />
      </Field>
      <RecoverLink to="/">Esqueci minha senha</RecoverLink>

      <Button type="submit">Acessar</Button>
      <AuthLink to="/register">
        Ainda não tem Vip Club? Cadastre-se agora!
      </AuthLink>
    </AuthForm>
  );
}
