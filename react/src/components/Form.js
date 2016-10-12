import React from 'react';

const Form = props => {
  return (
    <form onSubmit={props.handleFormSubmit}>
    <input
      type="text"
      placeholder="District title"
      value={props.name}
      onChange={props.handleChange}
      />

      <textarea
        placeholder="Description"
        value={props.description}
        onChange={props.handleDescription}
        />

      <input type="submit" value="Add District" />
    </form>
  );
};

export default Form;
