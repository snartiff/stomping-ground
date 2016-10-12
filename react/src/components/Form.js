import React from 'react';

const Form = props => {
  return (

    <form onSubmit={props.handleFormSubmit} className="district-form">
    <h2 className="new-district">New District Form</h2>
    <label>District Name</label>
    <input
      type="text"
      placeholder="Give me a name"
      value={props.name}
      onChange={props.handleChange}
      />

    <label>Description</label>
      <textarea
        placeholder="Tell us about your district!"
        value={props.description}
        onChange={props.handleDescription}
        />

      <input type="submit" value="Add District" />
    </form>
  );
};

export default Form;
