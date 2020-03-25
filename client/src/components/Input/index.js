import React, { useRef, useEffect } from 'react';
import { useField } from '@unform/core';
import PropTypes from 'prop-types';

import {
  Label,
  IconInputContainer,
  InputIcon,
  AuthInput,
  Error,
} from './styles';

export default function Input({ name, label, icon, ...rest }) {
  const inputRef = useRef(null);

  const { fieldName, defaultValue, registerField, error } = useField(name);

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: inputRef.current,
      path: 'value',
    });
  }, [fieldName, registerField]);

  return (
    <>
      <Label htmlFor={fieldName}>{label}</Label>
      <IconInputContainer>
        <InputIcon path={icon} />
        <AuthInput
          id={fieldName}
          ref={inputRef}
          defaultValue={defaultValue}
          {...rest}
        />
      </IconInputContainer>
      {error && <Error>{error}</Error>}
    </>
  );
}

Input.propTypes = {
  name: PropTypes.string,
  label: PropTypes.string.isRequired,
  icon: PropTypes.string.isRequired,
};

Input.defaultProps = {
  name: '',
};
