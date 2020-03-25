import React, { useRef } from 'react';
import { Form as UnForm } from '@unform/web';
import * as Yup from 'yup';
import PropTypes from 'prop-types';

export default function Form({
  onSubmit,
  schema,
  initialData,
  children,
  ...rest
}) {
  const formRef = useRef(null);

  async function handleSubmit(data) {
    try {
      formRef.current.setErrors({});

      await schema.validate(data, {
        abortEarly: false,
      });

      onSubmit(data);
    } catch (err) {
      const validationErrors = {};

      if (err instanceof Yup.ValidationError) {
        err.inner.forEach(error => {
          validationErrors[error.path] = error.message;
        });
        formRef.current.setErrors(validationErrors);
      }
    }
  }

  return (
    <UnForm
      ref={formRef}
      onSubmit={handleSubmit}
      initialData={initialData}
      {...rest}
    >
      {children}
    </UnForm>
  );
}

Form.propTypes = {
  onSubmit: PropTypes.func.isRequired,
  schema: PropTypes.object,
  initialData: PropTypes.object,
  children: PropTypes.oneOfType([PropTypes.string, PropTypes.node]),
};

Form.defaultProps = {
  schema: {},
  initialData: {},
  children: '',
};
