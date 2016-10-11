import React from 'react';

const Form = props => {
  return (
    <form onSubmit={props.handleFormSubmit}>
    <input
      type="text"
      placeholder="District title"
      value={props.name}
      onChange={props.onChange}
      />

      <input
        type="text"
        placeholder="Description"
        value={props.description}
        onChange={props.onChange}
        />

      <input type="submit" value="Add District" />
    </form>
  );
};

export default Form;
