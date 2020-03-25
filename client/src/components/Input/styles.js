import styled from 'styled-components';
import Icon from '@mdi/react';

export const Label = styled.label`
  font: 14px/22px 'Arial';
  color: #7f7f7f;
  margin-bottom: 5px;
`;

export const IconInputContainer = styled.div`
  position: relative;
`;

export const AuthInput = styled.input`
  width: 100%;
  background: #fff;
  border: 1px solid #bfbfbf;
  border-radius: 5px;
  height: 40px;
  font: 14px/22px 'Arial';
  color: #404040;
  padding-left: 48px;
`;

export const InputIcon = styled(Icon).attrs({
  color: '#B9404F',
  size: '24px',
})`
  position: absolute;
  left: 14px;
  top: 50%;
  transform: translateY(-50%);
`;

export const Error = styled.div``;
