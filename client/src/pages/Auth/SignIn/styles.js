import styled from 'styled-components';
import { Link } from 'react-router-dom';
import { lighten } from 'polished';

import Form from '~/components/Form';

export const AuthForm = styled(Form)`
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 450px;
`;
export const Field = styled.div`
  width: 100%;
  font: 14px/22px 'Arial';
  color: #7f7f7f;
  & + div {
    margin-top: 20px;
  }
`;

export const AuthLink = styled(Link)`
  align-self: center;
  text-decoration: underline;
  margin-top: 5px;
  color: #404040 !important;
`;

export const RecoverLink = styled(AuthLink)`
  align-self: flex-end;
`;

export const Button = styled.button`
  margin-top: 40px;
  width: 274px;
  height: 40px;
  background: #b9404f;
  border: none;
  border-radius: 5px;
  display: flex;
  justify-content: center;
  user-select: none;
  align-items: center;
  font: Bold 16px/24px 'Montserrat', sans-serif;
  color: #fff;
  margin-bottom: 15px;
  cursor: pointer;
  &:hover {
    background: ${lighten(0.05, '#b9404f')};
  }
`;
